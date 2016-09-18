require "simplecov"

SimpleCov.start do
  add_filter "/config/"
  add_filter "/coverage/"
  add_filter "/spec/"
  add_filter "/vendor/"
  add_filter "/environment.rb"

  add_group "Libraries", "/lib/"
end

require File.expand_path("../../environment", __FILE__)
require "helpers/fake_slack_ruby_client"
require "helpers/fake_ri"

RSpec.configure do |config|
  # silence STDOUT messages
  config.before { allow($stdout).to receive(:puts) }
  # configure fake client to stub Slack::RealTime::Client
  config.before { Slack::Config.token = "authorized" }
  config.add_setting :fake_slack_client, default: FakeSlackRubyClient.new
end
