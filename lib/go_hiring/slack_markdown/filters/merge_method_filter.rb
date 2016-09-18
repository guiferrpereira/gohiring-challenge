# frozen_string_literal: true
module GoHiring
  module SlackMarkdown
    # Public: Filter Module has all filters that markdown will be converted
    module Filters
      # Public: MergeMethodFilter will merge all methods into prettier format
      #
      # documentation - Documentation received from Ri Command
      #
      # Examples
      #
      #    GoHiring::SlackMarkdown::Filters::MergeMethodFilter.new("Class methods\n\n test\n any?\n first")
      #
      # Returns documentation with methods merged
      class MergeMethodFilter < Struct.new(:documentation)
        # Public: Merge method list inside markdown
        #
        # documentation   -  Ri documentation with old markdown
        #
        # Examples
        #
        #    GoHiring::SlackMarkdown::Filters::MergeMethodFilter.new("--- Class methods\n\n test\n any?\n first").run
        #    # => "--- Class methods\n test, any?, first"
        #
        # Returns clean text with merged methods for Slack Markdown
        def run
          clean_all_blocks!

          documentation
        end

      private

        # Private: Clean all Class methods blocks
        def clean_all_blocks!
          class_methods_block.each do |block|
            clean!(block)
          end
        end

        # Private: Get Class methods block
        def class_methods_block
          documentation.split(/^\n---$/).select do |block|
            block.include?("Class methods")
          end
        end

        # Private: Clean Class methods block and replace at documentation
        def clean!(class_block)
          converted = merge_methods!(class_block)
          converted = clean_non_method!(converted)

          replace!(class_block, converted)
        end

        # Private: Replace new line break for comma
        def merge_methods!(text)
          text.gsub(/\n( )/, ", ")
        end

        # Private: Clean first method with extra comma
        def clean_non_method!(text)
          text.gsub(/:\n,/, ":\n")
        end

        # Private: Replace the fixed block in full text
        def replace!(replacable, converted)
          self.documentation = documentation.gsub(replacable, converted)
        end
      end
    end
  end
end
