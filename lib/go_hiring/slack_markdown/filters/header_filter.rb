module GoHiring
  module SlackMarkdown
    # Public: Filter Module has all filters that markdown will be converted
    module Filters
      # Public: HeaderFilter will convert markdownheaders into prettier format
      #
      # documentation - Documentation received from Ri Command
      #
      # Examples
      #
      #    GoHiring::SlackMarkdown::Filters::HeaderFilter.new("# Header")
      #
      # Returns documentation with methods merged
      class HeaderFilter < Struct.new(:documentation)
        # Public: Replaces markdown header # Header for * Header *
        #         block inside markdown
        #
        # documentation   -  Ri documentation with old markdown
        #
        # Examples
        #
        #    GoHiring::SlackMarkdown::Filters::HeaderFilter.new("# Header").run
        #    # => "* Header *"
        #
        # Returns formatted Header for Slack Markdown
        def run
          self.documentation = documentation.gsub(HEADER_PATTERN) do
            "*#{Regexp.last_match[1]}*"
          end
        end

        # Public: Regexp for header
        HEADER_PATTERN = /(?<=^|\W)\#(.+)(?=\W|$)/
      end
    end
  end
end
