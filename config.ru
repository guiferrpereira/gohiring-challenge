# frozen_string_literal: true
# This file is used by Rack-based servers to start the application.
require File.expand_path("../environment", __FILE__)

run GoHiring.run
