# frozen_string_literal: true
module GoHiring
  # Public: Module responsible to initialize bot
  module Bot
    # Public: Starts slack bot client and waits for new messages
    #
    # client  - Slack::RealTime::Client Object initialized
    #
    # Examples
    #
    #    GoHiring::Bot::Start.run(client)
    #
    # raises Error if token not provided
    class Start
      # Public: Starts client and waits for new messages
      #
      # client  - Slack::RealTime::Client Object initialized
      #
      # Examples
      #
      #    GoHiring::Bot::Start.call(client)
      #
      # Returns started slack client
      def self.run(client)
        client.start!
      end
    end
  end
end
