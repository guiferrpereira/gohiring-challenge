# frozen_string_literal: true
require "json"

root = File.expand_path("../..", __FILE__)

require File.join(root, "config", "/initializers/settings")

working_directory root

listen "0.0.0.0:#{ENV['PORT'] || GoHiring::Config['webserver']['port']}"
worker_processes ("#{ENV['WORKERS'] || GoHiring::Config['webserver']['workers']}").to_i
timeout 30
