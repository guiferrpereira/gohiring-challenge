# Public: Method used start Ruby Doc Bot.
# All methods are module methods and should be called on the GoHiring module.
#
# Examples
#
#   GoHiring.run
#   # Successfully connected, welcome 'rubydoc' to the 'GoHiring' team at https://gohiring.slack.com.
module GoHiring
  # Public: Responsible to start program by calling RubyDocBot class
  #
  # options - A Hash containing optional values for internal services
  #           :client - The Slack RealTime API Client that will be
  #                     communicating with Slack's API (optional).
  #
  # Examples
  #
  #   docbot = GoHiring.run
  #
  # Returns Application initialized and waiting for messages
  def self.run(options = {})
    RubyDocBot.new(options).run!
  end
end
