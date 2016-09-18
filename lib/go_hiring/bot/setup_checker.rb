module GoHiring
  module Bot
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
