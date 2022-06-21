if ENV.delete('COVERAGE')
  require 'simplecov'

  SimpleCov.start do
    enable_coverage :branch
    add_filter "/spec/"
    add_group('Missing'){|src| src.covered_percent < 100}
    add_group('Covered'){|src| src.covered_percent == 100}
  end
end

gem 'minitest'
ENV['MT_NO_PLUGINS'] = '1' # Work around stupid autoloading of plugins
require 'minitest/global_expectations/autorun'
require 'capybara'
require 'capybara/dsl'
require_relative '../lib/capybara/restore_state'

MyRackApp = lambda do |env|
  s = "<html><body><form action='/a'>#{env['PATH_INFO']}<input type='submit' value='Submit' /></form></body></html>"
  [200, {'Content-Length'=>s.length}, s]
end
Capybara.app = MyRackApp

describe Capybara::RestoreState do
  include Rack::Test::Methods
  include Capybara::DSL
  include Capybara::RestoreState

  def app
    MyRackApp
  end

  it "should allow restoring of state" do
    visit '/'
    page.current_path.must_equal '/'
    page.text.must_equal '/'

    restore_state do
      page.text.must_equal '/'
      page.current_path.must_equal '/'
      click_button 'Submit'
      page.current_path.must_equal '/a'
      page.text.must_equal '/a'
    end

    page.current_path.must_equal '/'
    page.text.must_equal '/'
    click_button 'Submit'
    page.current_path.must_equal '/a'
    page.text.must_equal '/a'
  end
end
