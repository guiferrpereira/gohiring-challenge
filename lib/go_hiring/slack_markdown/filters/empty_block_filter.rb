module GoHiring
  module SlackMarkdown
    module Filters
      class EmptyBlockFilter < Struct.new(:documentation)
        # Public: Removes empty block inside markdown
        #
        # documentation   -  Ri documentation with old markdown
        #
        # Examples
        #
        #    GoHiring::SlackMarkdown::Filters::EmptyBlockFilter.new("---\n\n\n\n---").run
        #    # => "---"
        #
        # Returns formatted Empty Block for Slack Markdown
        def run
          self.documentation = documentation.gsub(EMPTY_BLOCK_PATTERN) do
            "---"
          end
        end

        # Public: Regexp for empty block pattern
        EMPTY_BLOCK_PATTERN = /(---\n*?---)$/
      end
    end
  end
end
