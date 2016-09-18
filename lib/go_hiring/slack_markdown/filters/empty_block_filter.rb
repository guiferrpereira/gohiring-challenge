# frozen_string_literal: true
module GoHiring
  module SlackMarkdown
    # Public: Filter Module has all filters that markdown will be converted
    module Filters
      # Public: EmptyBlockFilter will remove empty blocks from documentation
      #
      # documentation - Documentation received from Ri Command
      #
      # Examples
      #
      #    GoHiring::SlackMarkdown::Filters::EmptyBlockFilter.new("---\n\n\n\n---")
      #
      # Returns documentation cleaner, without empty blocks
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
