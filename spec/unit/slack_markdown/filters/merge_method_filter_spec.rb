# frozen_string_literal: true
require_relative "../../../spec_helper"

describe GoHiring::SlackMarkdown::Filters::MergeMethodFilter do
  let(:merge_method_filter) { GoHiring::SlackMarkdown::Filters::MergeMethodFilter }

  describe ".run" do
    it "Should merge methods and make them prettier" do
      documentation = ", 3]\n\n\n\n---\n# Class methods:\n\n    []\n    "\
                      "new\n    try_convert\n\n# Instance methods:\n\n    &\n    *\n "

      expect(merge_method_filter.new(documentation).run)
        .to eq ", 3]\n\n\n\n---\n# Class methods:\n    "\
               "[],    new,    try_convert\n\n# Instance methods:\n    &,    *, "
    end

    it "Shouldnt convert if there isnt any method list to convert" do
      documentation = "# Array#first*\n\n(from ruby core)\n---"
      expect(merge_method_filter.new(documentation).run).to eq documentation
    end
  end
end
