module GoHiring
  # Public: Ruby Doc Bot initializer. Responsible for call methods to start bot.
  class RubyDocBot
    # Public: Initialize RubyDocBot Class
    # It will create new client Slack::RealTime::Client from gem slack-ruby-client
    # This gem is wrapper to Slack API
    #
    # options - A Hash containing optional values for internal services
    #           :client - The Slack RealTime API Client that will be
    #                     communicating with Slack's API (optional).
    #
    # Examples
    #
    #    GoHiring::RubyDocBot.new.run!
    #
    # Returns initialized application and waiting for commands
    def initialize(options = {})
      @client ||= (options[:client] || Slack::RealTime::Client.new)
    end

    # Public: Check for credentials and starts Slack Client
    #
    #
    # Examples
    #
    #   docbot = GoHiring::RubyDocBot.new.run!
    #
    # Returns Slack::RealTime::Client running and waiting for slack messages
    def run!
      GoHiring::Bot::SetupChecker.run
      GoHiring::Bot::PrintHello.run(@client)
      GoHiring::Bot::MessageProcessor.run(@client)
      GoHiring::Bot::Start.run(@client)
    end
  end
end
