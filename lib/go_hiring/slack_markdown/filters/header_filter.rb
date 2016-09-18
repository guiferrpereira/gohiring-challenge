module GoHiring
  module SlackMarkdown
    module Filters
      class HeaderFilter < Struct.new(:documentation)
        # Public: Replaces markdown header # Header for * Header *
        #         block inside markdown
        #
        # documentation   -  Ri documentation with old markdown
        #
        # Examples
        #
        #    GoHiring::SlackMarkdown::Filters::EmptyBlockFilter.new("# Header").run
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
