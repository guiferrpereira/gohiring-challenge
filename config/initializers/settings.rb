# frozen_string_literal: true
module GoHiring
  Config = JSON.parse(File.read(File.join(File.expand_path("..", __FILE__), "..", "/settings.json")))
end
