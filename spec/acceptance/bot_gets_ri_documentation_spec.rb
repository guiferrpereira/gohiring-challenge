# frozen_string_literal: true
require_relative "../spec_helper"

describe "Bot gets ri documentation" do
  let(:fake_client) { RSpec.configuration.fake_slack_client }
  let(:settings) { { client: fake_client } }

  before(:each) do
    GoHiring.run(settings)
  end

  it "Bot should get documentation if command is at ruby docs" do
    message = { "channel" => "D839283", "user" => "gpereira", "text" => "Array#first " }

    fake_client.run(:message, message)

    expect(fake_client.sent_messages.last).to include("* Array#first*")
  end

  it "Bot shouldn't get documentation if command isn't at ruby docs" do
    message = { "channel" => "D839283", "user" => "gpereira", "text" => "OOOOOOO" }

    fake_client.run(:message, message)

    expect(fake_client.sent_messages.last).to include("Sorry, but i couldn't find any documentation with command")
  end

  it "Bot should detect an empty command and don't respond to it" do
    message = { "channel" => "General", "user" => "gpereira", "text" => "<@U2BLYBB89> " }

    fake_client.run(:message, message)

    expect(fake_client.sent_messages.last).to eq "You should send one command (e.g.: Array#first)"
  end
end
