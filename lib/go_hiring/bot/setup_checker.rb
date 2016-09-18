module GoHiring
  # Public: Module responsible to initialize bot
  module Bot
    # Public: Check if slack api token is provided
    #
    # Examples
    #
    #    GoHiring::Bot::SetupChecker.run
    #
    # raises Error if token not provided
    class SetupChecker
      # Returns Error if Slack token is not set
      # Returns nothing.
      # Raises GoHiring::Bot::Error if the SLACK token cannot be found.
      def self.run
        raise(Error, GoHiring::Config["messages"]["token_not_found"]) if Slack::Config.token.nil?
      end
    end

    # Public: Error Class inherits from RuntimeError
    class Error < RuntimeError; end
  end
end
