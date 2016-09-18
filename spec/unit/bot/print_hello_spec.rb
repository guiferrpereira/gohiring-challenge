# encoding: UTF-8
require_relative "../../spec_helper"

describe GoHiring::Bot::PrintHello do
  describe ".run" do
    it "prints hello message on bot sign in" do
      options = { name: "fake_ruby_doc", team_name: "fake team", domain: "fake_slack" }

      result =  "Successfully connected, welcome '#{options[:name]}' "\
                "to the '#{options[:team_name]}' team at https://#{options[:domain]}.slack.com.\n"

      expect do
        GoHiring::Bot::PrintHello.run(FakeSlackRubyClient.new(options))
      end.to output(result).to_stdout_from_any_process
    end
  end
end
