# frozen_string_literal: true
require_relative "../../../spec_helper"

describe GoHiring::SlackMarkdown::Filters::BlockBreakerFilter do
  let(:block_breaker_filter) { GoHiring::SlackMarkdown::Filters::BlockBreakerFilter }

  describe ".run" do
    it "Should convert block breaker into big block breaker" do
      documentation = "|\n\n(from gem activesupport-5.0.0.1)\n---\n#"

      expect(block_breaker_filter.new(documentation).run)
        .to eq "|\n\n(from gem activesupport-5.0.0.1)"\
               "\n------------------------------------------------------------------------------\n#"
    end

    it "Shouldnt convert if there isnt any block breaker" do
      documentation = "# Array#first*\n\n(from ruby core)\n"
      expect(block_breaker_filter.new(documentation).run).to eq documentation
    end
  end
end
