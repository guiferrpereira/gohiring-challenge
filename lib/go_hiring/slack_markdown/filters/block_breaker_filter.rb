# frozen_string_literal: true
module GoHiring
  module SlackMarkdown
    # Public: Filter Module has all filters that markdown will be converted
    module Filters
      # Public: BlockBreakerFilter will replace block breaker for bigger format
      #
      # documentation - Documentation received from Ri Command
      #
      # Examples
      #
      #    GoHiring::SlackMarkdown::Filters::BlockBreakerFilter.new("---")
      #
      # Returns documentation with large block breakers
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
