# frozen_string_literal: true
require_relative "../../spec_helper"

describe GoHiring::Bot::Start do
  describe ".run" do
    it "Starts bot" do
      expect(GoHiring::Bot::Start.run(RSpec.configuration.fake_slack_client)).to eq :running
    end
  end
end
