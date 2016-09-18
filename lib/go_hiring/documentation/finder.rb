module GoHiring
  module Documentation
    class Finder < Struct.new(:command)
      # Public: Get Ri documentation
      #
      #  command  - command read from slack (Should be valid to get some documentation)
      #  format   - message format for ri command (Valid formatters are: ansi bs markdown rdoc)
      #
      # Examples
      #
      #    GoHiring::Documentation::Finder.process("Array#fourth")
      #    # => "# Array#fourth --- ...."
      #
      # Returns new documentation with markdown format
      def run(format = "markdown")
        ri_documentation = `ri #{clean_command} --format=#{format}`

        return nil if ri_documentation.nil? || ri_documentation.to_s.empty?
        ri_documentation
      end

    private

      # Private: Only allow Letters and characters that can be part of methods
      def clean_command
        command.gsub(/[^A-Za-z\d:_.!#?]/, "")
      end
    end
  end
end
