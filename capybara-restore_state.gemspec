Gem::Specification.new do |s|
  s.name = 'capybara-restore_state'
  s.version = '1.0.1'
  s.platform = Gem::Platform::RUBY
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG", "MIT-LICENSE"]
  s.rdoc_options += ["--quiet", "--line-numbers", "--inline-source", '--title', 'capybara-restore_state: Restore capybara state after block execution', '--main', 'README.rdoc']
  s.license = "MIT"
  s.summary = "Restore capybara state after block execution"
  s.author = "Jeremy Evans"
  s.email = "code@jeremyevans.net"
  s.homepage = "http://github.com/jeremyevans/capybara-restore_state"
  s.files = %w(MIT-LICENSE CHANGELOG README.rdoc Rakefile lib/capybara/restore_state.rb)
  s.description = <<END
capybara-restore_state offers the ability to execute a block where the
initial capybara state on entering the block is returned after the block
is executed.  This makes it possible to test things like clicking on the
same button twice.
END
  s.metadata = {
    'source_code_uri'   => 'https://github.com/jeremyevans/capybara-restore_state',
    'bug_tracker_uri'   => 'https://github.com/jeremyevans/capybara-restore_state/issues',
    'mailing_list_uri'  => 'https://github.com/jeremyevans/capybara-restore_state/discussions',
    'changelog_uri'     => 'https://github.com/jeremyevans/capybara-restore_state/blob/master/CHANGELOG',
  }

  s.add_dependency 'rack-test', '>= 0.6'
  s.add_dependency 'capybara', '>= 2.1.0'
  s.add_development_dependency "minitest-global_expectations"
end
