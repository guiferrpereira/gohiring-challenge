# encoding: UTF-8
require_relative "../spec_helper"

describe GoHiring do
  describe ".run" do
    it "raises error if slack api token not configured" do
      Slack::Config.token = nil

      expect { GoHiring.run }.to raise_error(GoHiring::Bot::Error)
    end

    it "raises error if token provided is not authorized" do
      Slack::Config.token = "xpto"

      expect { GoHiring.run }.to raise_error(Slack::Web::Api::Error)
    end

    it "should authorized start when token provided" do
      expect(GoHiring.run).to eq :running
    end
  end
end
