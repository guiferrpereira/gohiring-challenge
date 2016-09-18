# frozen_string_literal: true
require_relative "../../spec_helper"

describe GoHiring::Bot::SetupChecker do
  describe ".run" do
    it "raises error if slack api token not configured on checker" do
      Slack::Config.token = nil

      expect do
        GoHiring::Bot::SetupChecker.run
      end.to raise_error(GoHiring::Bot::Error)
    end

    it "error message should be retrieved from settings.json" do
      Slack::Config.token = nil
      expect do
        GoHiring::Bot::SetupChecker.run
      end.to raise_error(GoHiring::Bot::Error, GoHiring::Config["messages"]["token_not_found"])
    end
  end
end
