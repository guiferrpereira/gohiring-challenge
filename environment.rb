# frozen_string_literal: true
require "rubygems"
require "json"

Dir["config/initializers/*.rb", "lib/**/*.rb"].each do |file|
  require_relative file
end

# require initializers
require File.join(File.dirname(__FILE__), "config", "/initializers/settings")
require File.join(File.dirname(__FILE__), "config", "/initializers/slack")
