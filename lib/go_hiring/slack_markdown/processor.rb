module GoHiring
  # Public: Module responsible for markdown conversion
  module SlackMarkdown
    # Public: Processor will call all filters available
    #        to transform markdown in slack pretty markdown
    #
    #
    # documentation - Documentation received from Ri Command
    #
    # Examples
    #
    #    GoHiring::SlackMarkdown::Processor.new(documentation).run!
    #
    # Returns documentation with pretty format
    class Processor < Struct.new(:documentation)
      # Public: Process markdown documentation into slack markdown
      #
      # documentation   -  Ri documentation with old markdown
      #
      # Examples
      #
      #    GoHiring::SlackMarkdown::Processor.new("# Array#fourth* --- ....").run
      #    # => "* Array#fourth* --- ...."
      #
      # Returns Pretty formatted text for Slack Markdown
      def run
        filters.each do |filter|
          self.documentation = filter.new(documentation).run
        end

        documentation
      end

    private

      # Private: Retrieve list of markdown to slack markdown filters
      def filters
        [
          GoHiring::SlackMarkdown::Filters::MergeMethodFilter,
          GoHiring::SlackMarkdown::Filters::HeaderFilter,
          GoHiring::SlackMarkdown::Filters::EmptyBlockFilter,
          GoHiring::SlackMarkdown::Filters::BlockBreakerFilter
        ]
      end
    end
  end
end
