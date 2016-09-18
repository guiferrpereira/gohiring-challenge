module GoHiring
  # Public: Module responsible to initialize bot
  module Bot
    # Public: Print hello when successfully signs in slack
    #
    # client  - Slack::RealTime::Client Object initialized
    #
    # Examples
    #
    #    GoHiring::Bot::PrintHello.new(client)
    class PrintHello
      # Public: Print Hello message when successfully signs in slack
      # This message will exit on STDOUT
      #
      # client  - Slack::RealTime::Client Object initialized
      #
      # Examples
      #
      #    GoHiring::Bot::PrintHello.print(client)
      #    # => 'Successfully connected, welcome 'rubydoc' to the 'Porto Codes' team at https://portocodes.slack.com.'
      #
      # Returns STDOUT message
      def self.run(client)
        client.on :hello do
          STDOUT.puts new(client).print
        end
      end

      # Public: Client Returns the Slack::RealTime::Client object.
      attr_reader :client

      # Public: Initialize a Print Hello.
      #
      # client - Slack::RealTime::Client object.
      def initialize(client)
        @client = client
      end

      # Public: Returns string message for hello. It will read from settings.json
      #         and will merge with client settings name / team name and team domain
      #
      # Examples
      #
      #    GoHiring::Bot::PrintHello.new(client).print
      #    # => 'Successfully connected, welcome 'rubydoc' to the 'Porto Codes' team at https://portocodes.slack.com.'
      #
      # Returns String message
      def print
        GoHiring::Config["messages"]["hello"] % settings
      end

    private

      # Private: Returns Hash with settings to be replaced on hello message
      def settings
        {
          name:   @client.self.name,
          team:   @client.team.name,
          domain: @client.team.domain
        }
      end
    end
  end
end
