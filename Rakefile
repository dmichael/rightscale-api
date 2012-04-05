$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib', 'rightscale-api')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "rightscale-api"
    gemspec.summary = "A Ruby Wrapper for the RightScale API"
    gemspec.description = "A Ruby Wrapper for the RightScale API"
    gemspec.email = "david.michael@sonymusic.com"
    gemspec.homepage = "http://github.com/dmichael/rightscale-api"
    gemspec.authors = ["David Michael"]
    gemspec.add_dependency "httparty"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
