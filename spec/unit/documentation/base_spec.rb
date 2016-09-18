# frozen_string_literal: true
require_relative "../../spec_helper"

describe GoHiring::Documentation::Base do
  let(:documentation_base) { GoHiring::Documentation::Base }

  describe ".get" do
    it "Should get documentation not found message" do
      expect(documentation_base.new("OOOOOOO").get).to include("Sorry, but i couldn't find")
    end

    it "Should get some documentation about command" do
      expect(documentation_base.new("Array#first").get).to include("* Array#first")
    end
  end
end
