# frozen_string_literal: true
require_relative "../../spec_helper"

describe GoHiring::Documentation::Formatter do
  let(:documentation_formatter) { GoHiring::Documentation::Formatter }

  describe ".run" do
    it "Should convert old markdown into pretty markdown to Slack" do
      formatted = documentation_formatter.new("# Array#first\n\n(from ruby core)\n---").run

      expect(formatted).to eq "* Array#first*\n\n(from ruby core"\
       ")\n------------------------------------------------------------------------------"
    end
  end
end
