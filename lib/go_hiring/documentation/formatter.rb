# frozen_string_literal: true
module GoHiring
  # Public: Module responsible to get and format documentation
  module Documentation
    # Public: Formatter will format documentation processing filters
    #
    # documentation - Ruby command to send Ri
    #
    # Examples
    #
    #    GoHiring::Documentation::Formatter.new("# Array#first ....")
    #
    # Returns formatted documentation
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
