# frozen_string_literal: true
require_relative "../../spec_helper"

describe GoHiring::Documentation::Finder do
  let(:documentation_finder) { GoHiring::Documentation::Finder }

  describe ".find" do
    it "Should return empty string when documentation not found" do
      expect(documentation_finder.new("OOOOOOO").run).to be_nil
    end

    it "Should find some documentation on command" do
      expect(documentation_finder.new("Array#first").run).to include("# Array#first")
    end

    it "Should clean command if takes some weird characters on it and return proper documentation" do
      expect(documentation_finder.new("´´Array#first").run).to include("# Array#first")
    end
  end
end
