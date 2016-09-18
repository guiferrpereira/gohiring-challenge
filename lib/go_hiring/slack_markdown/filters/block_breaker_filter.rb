module GoHiring
  module SlackMarkdown
    module Filters
      class BlockBreakerFilter < Struct.new(:documentation)
        # Public: Replaces block breaker "---"
        #  for "------------------------------------------------------------------------------"
        #  this is a prerequisite from GoHiring
        #
        # documentation   -  Ri documentation with old markdown
        #
        # Examples
        #
        #    GoHiring::SlackMarkdown::Filters::BlockBreakerFilter.new("---").run
        #    # => "------------------------------------------------------------------------------"
        #
        # Returns formatted Block Breaker for Slack Markdown
        def run
          self.documentation = documentation.gsub(BLOCK_BREAKER_PATTERN) do
            "------------------------------------------------------------------------------"
          end
        end

        # Public: Regexp for empty block pattern
        BLOCK_BREAKER_PATTERN = /(---)$/
      end
    end
  end
end
