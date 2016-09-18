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
  #
  # Examples
  #
  #   docbot = GoHiring.run
  #
  # Returns initialized application
  def self.run(options = {})
    RubyDocBot.new(options).run!
  end
end
