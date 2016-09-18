# frozen_string_literal: true
module GoHiring
  # Public: Module responsible to get and format documentation
  module Documentation
    # Public: Base will get ri documentation
    #
    # command - Ruby command to send Ri
    #
    # Examples
    #
    #    GoHiring::Documentation::Base.new("Array#first")
    #
    # Returns documentation from ri command
    class Base < Struct.new(:command)
      # Public: Get Documentation / Message that should be returned to slack user
      #
      #  command  - command read from slack (Should be valid to get some documentation)
      #
      # Examples
      #
      #    GoHiring::Documentation::Base.new("Array#fourth").get
      #    # => "Array#fourth ...."
      #
      # Returns new documentation about method requested with pretty format
      def get
        return documentation_not_found if documentation.nil?

        GoHiring::Documentation::Formatter.new(documentation).run
      end

    private

      # Private: Will try find some documentation to provided command
      def documentation
        GoHiring::Documentation::Finder.new(command).run
      end

      # Private: Get nice message from settings.json, telling that no docs where found!
      def documentation_not_found
        GoHiring::Config["messages"]["documentation_not_found"] % command
      end
    end
  end
end
