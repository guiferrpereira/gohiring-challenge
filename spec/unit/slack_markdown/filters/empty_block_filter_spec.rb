# frozen_string_literal: true
require_relative "../../../spec_helper"

describe GoHiring::SlackMarkdown::Filters::EmptyBlockFilter do
  let(:empty_block_filter) { GoHiring::SlackMarkdown::Filters::EmptyBlockFilter }

  describe ".run" do
    it "Should convert empty block into nothing" do
      documentation = "|\n\n(from gem activesupport-5.0.0.1)\n---\n\n\n\n\n\n\n\n\n\n\n\n---\n# "
      expect(empty_block_filter.new(documentation).run).to eq "|\n\n(from gem activesupport-5.0.0.1)\n---\n# "
    end

    it "Shouldnt convert if there isnt any empty block" do
      documentation = "# Array#first*\n\n(from ruby core)\n---"
      expect(empty_block_filter.new(documentation).run).to eq documentation
    end
  end
end
