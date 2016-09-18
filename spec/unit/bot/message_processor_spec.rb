# encoding: UTF-8
require_relative "../../spec_helper"

describe GoHiring::Bot::MessageProcessor do
  let(:client) { RSpec.configuration.fake_slack_client }
  let(:message_count) { client.sent_messages.count }

  describe ".run" do
    it "Shouldn't process message if bot sending to himself" do
      message = { "channel" => "General", "user" => "U2BLYBB89", "text" => "Array" }

      GoHiring::Bot::MessageProcessor.run(client)

      expect(client.run(:message, message)).to be_nil
    end
  end

  describe "process" do
    it "Shouldn't send message, if is not assigned to bot" do
      message = { "channel" => "General", "text" => "<@XXXXXXX> Array" }

      result_expected = message_count
      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.count).to eq result_expected
    end

    it "Shouldn't send message, if message empty" do
      message = { "channel" => "General", "text" => "" }

      result_expected = message_count
      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.count).to eq result_expected
    end

    it "Should send message with bot on subject" do
      message = { "channel" => "General", "text" => "<@U2BLYBB89> Array" }

      result_expected = message_count + 1
      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.count).to eq result_expected
    end

    it "Should send message with bot on direct channel" do
      message = { "channel" => "D839283", "text" => "Hash" }
      result_expected = message_count + 1

      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.count).to eq result_expected
    end

    it "Should send message with advanced command" do
      message = { "channel" => "D839283", "text" => "please explain Hash" }
      result_expected = message_count + 1

      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.count).to eq result_expected
    end

    it "Should send help message if help command provided" do
      message = { "channel" => "D839283", "text" => "help" }
      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.last).to eq "You should send one command (e.g.: Array#first)"
    end

    it "Should send help message if no command provided" do
      message = { "channel" => "General", "text" => "<@U2BLYBB89> " }
      GoHiring::Bot::MessageProcessor.new(client, message).process
      expect(client.sent_messages.last).to eq "You should send one command (e.g.: Array#first)"
    end
  end
end
