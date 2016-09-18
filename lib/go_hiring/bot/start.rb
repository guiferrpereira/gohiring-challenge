module GoHiring
  module Bot
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
