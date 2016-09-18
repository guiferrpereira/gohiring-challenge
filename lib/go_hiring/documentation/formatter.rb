module GoHiring
  module Documentation
    class Formatter < Struct.new(:documentation)
      # Public: Gets formatted documentation in slack markdown as decribed here:
      # # https://api.slack.com/docs/message-formatting
      #
      # documentation   -  Ri documentation with old markdown
      #
      #
      # Examples
      #
      #    GoHiring::Documentation::Formatter.new("# Array#fourth --- ....").process
      #    # => "* Array#fourth* --- ...."
      #
      # Returns Pretty formatted text for Slack Markdown
      def run
        GoHiring::SlackMarkdown::Processor.new(documentation).run
      end
    end
  end
end
