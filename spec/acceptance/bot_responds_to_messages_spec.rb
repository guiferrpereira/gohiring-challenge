# frozen_string_literal: true
require_relative "../spec_helper"

describe "Bot should respond to messages" do
  let(:fake_client) { RSpec.configuration.fake_slack_client }
  let(:message_count) { fake_client.sent_messages.count }
  let(:settings) { { client: fake_client } }

  before(:each) do
    GoHiring.run(settings)
  end

  it "Bot should respond direct messages 'private chat'" do
    message = { "channel" => "D839283", "user" => "gpereira", "text" => "Array" }

    result = message_count + 1
    fake_client.run(:message, message)

    expect(fake_client.sent_messages.count).to eq result
  end

  it "Bot should respond messages addressed to him '@-mention command'" do
    message = { "channel" => "General", "user" => "gpereira", "text" => "<@U2BLYBB89> Array" }

    result = message_count + 1
    fake_client.run(:message, message)

    expect(fake_client.sent_messages.count).to eq result
  end

  it "Bot should respond advanced messages addressed to him 'advanced command'" do
    message = { "channel" => "General", "user" => "gpereira", "text" => "<@U2BLYBB89> please explain Array" }

    result = message_count + 1
    fake_client.run(:message, message)

    expect(fake_client.sent_messages.count).to eq result
  end

  it "Bot shouldn't respond to himself" do
    message = { "channel" => "General", "user" => "U2BLYBB89", "text" => "<@U2BLYBB89> please explain Array" }

    result = message_count
    fake_client.run(:message, message)

    expect(fake_client.sent_messages.count).to eq result
  end

  it "Bot shouldn't respond to message that doesn't mention him in general chat" do
    message = { "channel" => "General", "user" => "gpereira", "text" => "please explain Array" }

    result = message_count
    fake_client.run(:message, message)

    expect(fake_client.sent_messages.count).to eq result
  end
end
