module GoHiring
  class RubyDocBot
    # Public: Initialize RubyDocBot Class
    # It will create new client Slack::RealTime::Client from gem slack-ruby-client
    # This gem is wrapper to Slack API
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
