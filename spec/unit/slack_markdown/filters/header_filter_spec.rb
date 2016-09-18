# frozen_string_literal: true
require_relative "../../../spec_helper"

describe GoHiring::SlackMarkdown::Filters::HeaderFilter do
  let(:header_filter) { GoHiring::SlackMarkdown::Filters::HeaderFilter }

  describe ".run" do
    it "Should convert markdown title into slack title" do
      documentation = header_filter.new("# Array#first\n\n(from ruby core)\n").run
      expect(documentation).to eq "* Array#first*\n\n(from ruby core)\n"
    end

    it "Shouldnt convert if there isn't anything to convert" do
      documentation = "(from ruby core)\n---"
      expect(header_filter.new(documentation).run).to eq documentation
    end
  end
end
