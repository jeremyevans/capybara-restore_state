require "rake"
require "rake/clean"
require 'rake/testtask'

CLEAN.include ["capybara-restore_state-*.gem", "rdoc", "coverage"]

desc "Build enum_csv gem"
task :package=>[:clean] do |p|
  sh %{#{FileUtils::RUBY} -S gem build capybara-restore_state.gemspec}
end

### Specs

desc "Run specs"
task :default=>:spec

desc "Run specs"
task :spec do
  sh "#{FileUtils::RUBY} #{'-w' if RUBY_VERSION >= '3'} spec/capybara-restore_state_spec.rb"
end

### RDoc

RDOC_DEFAULT_OPTS = ["--quiet", "--line-numbers", "--inline-source", '--title', 'capybara-restore_state: Restore capybara state after block execution']

begin
  gem 'hanna-nouveau'
  RDOC_DEFAULT_OPTS.concat(['-f', 'hanna'])
rescue Gem::LoadError
end

rdoc_task_class = begin
  require "rdoc/task"
  RDoc::Task
rescue LoadError
  require "rake/rdoctask"
  Rake::RDocTask
end

RDOC_OPTS = RDOC_DEFAULT_OPTS + ['--main', 'README.rdoc']

rdoc_task_class.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.options += RDOC_OPTS
  rdoc.rdoc_files.add %w"README.rdoc CHANGELOG MIT-LICENSE lib/**/*.rb"
end

