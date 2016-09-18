# encoding: UTF-8
require_relative "../../spec_helper"

describe GoHiring::SlackMarkdown::Processor do
  let(:slack_markdown_processor) { GoHiring::SlackMarkdown::Processor }

  describe ".run" do
    it "Should convert old markdown into pretty markdown to Slack" do
      expect(slack_markdown_processor.new("# Array#first\n\n(from ruby core)\n---").run)
        .to eq "* Array#first*\n\n(from ruby core)"\
               "\n------------------------------------------------------------------------------"
    end
  end
end
