module GoHiring
  module Bot
    class MessageProcessor
      # Public: Analyzes incoming messages only if incoming messages aren't from bot himself
      #
      # client  - Slack::RealTime::Client Object initialized
      #
      # Examples
      #
      #    GoHiring::Bot::MessageProcessor.analyze(client)
      #
      # Returns new message user if rules says so
      def self.run(client)
        client.on :message do |data|
          new(client, data).process if client.self.id != data["user"]
        end
      end

      # Public: Client Returns the Slack::RealTime::Client object.
      # Public: Message Returns the message written in slack.
      # Public: Channel Returns the slack channel from message was written.
      attr_reader :client, :message, :channel

      # Public: Initialize a Message Analyzer.
      #
      # client - Slack::RealTime::Client object.
      # data - Data catched from slack (includes text message, user, channel, etc)
      def initialize(client, data)
        @client  = client
        @message = data["text"]
        @channel = data["channel"]
      end

      # Public: Analyzes if incoming message should be processed or not
      # If is empty message or message isn't directed to bot won't be processed
      #
      # Examples
      #
      #    GoHiring::Bot::MessageProcessor.process
      #
      # Returns Will send message if processed
      def process
        send_message if !message_empty? && message_to_bot?
      end

    private

      # Private: Writes message to slack
      def send_message
        @client.message channel: @channel, text: valid_documentation
      end

      # Private: Gets text message to be written in slack
      def documentation
        GoHiring::Documentation::Base.new(ruby_method).get
      end

      # Private: Check if incoming message is empty
      def message_empty?
        @message.nil? || @message.to_s.empty?
      end

      # Private: Check if incoming message is directed to bot as described on pre-requisites
      def message_to_bot?
        @message.scan(/^\<\@#{@client.self.id}\>/).count.positive? || @channel[0] == "D"
      end

      # Private: Get ruby method that user send to bot
      def ruby_method
        @ruby_method ||= @message.gsub(/^\<\@#{@client.self.id}\>:? ?(please explain)*?/, "")
      end

      # Private: Get documentation or receive help command
      def valid_documentation
        help_or_empty_command? ? command_help : documentation
      end

      # Private: Check if ruby method is empty string or help
      def help_or_empty_command?
        ruby_method.empty? || ruby_method.eql?("help")
      end

      # Private: Get help message from settings.json
      def command_help
        GoHiring::Config["messages"]["command_help"]
      end
    end
  end
end
