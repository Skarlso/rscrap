require 'bundler'
Bundler::GemHelper.install_tasks

task :test do
  $LOAD_PATH << 'lib'
  require 'minitest/autorun'
  require 'phocus'
  require 'jsonpathv2'
  Dir['./test/**/test_*.rb'].each { |test| require test }
end

task default: :test
