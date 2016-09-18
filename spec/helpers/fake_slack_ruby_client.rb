require "spec_helper"

class FakeSlackRubyClient
  # Internal: Returns an Array of Strings containing outgoing messages.
  attr_reader :sent_messages

  # Internal: Creates a new fake Slack client.
  #
  # options - Bot Settings (Default: {})
  #           :name      - fake user's Slack username (optional).
  #           :id        - fake user's internal Slack ID (optional).
  #           :team_name - fake Slack team's name (optional).
  #           :domain    - fake Slack team's domain (optional).
  def initialize(options = {})
    @events        = {}
    @sent_messages = []
    @name          = options[:name]      || "rubydoc"
    @team_name     = options[:team_name] || "gohiring"
    @domain        = options[:domain]    || "gohiring"
    @id            = options[:id]        || "U2BLYBB89"
  end

  # Internal: Mock call to the Slack client's .start!
  def start!
    return :running if has_valid_token?

    raise Slack::Web::Api::Error, "Token not set!"
  end

  # Internal: Check for Slack Bot valid token!
  def has_valid_token?
    !Slack::Config.token.nil? && Slack::Config.token == "authorized"
  end

  # Internal: Mock a call to the Slack client's event handler.
  #
  # event - The Symbol name of the event being hooked ex(:hello, :message).
  # block - The code block that will be executed.
  #
  # Examples
  #   on :message, { puts "Array#first < Object"}
  #
  # Returns nothing for :message
  def on(event, &block)
    case event
      when :hello
        yield block
      else
        @events[event] = block
    end
  end

  # Internal: Executes an event block that was stored earlier using #on.
  #
  # event - The original Symbol name of the event stored using #on.
  # params - Params that will be passed to the executed block (Default: nil).
  def run(event, params = nil)
    @events[event].call(params)
  end

  # Internal: Mock the Slack client's method for sending a message.
  #
  # options - The options hash that would be passed to the Slack client.
  def message(options)
    @sent_messages << options[:text]
  end

  # Internal: Mock the call to the Slack client for team.
  #
  # Returns a struct that answers calls to .name and .domain
  def team
    @team ||= Struct.new(:name, :domain).new(@team_name, @domain)
  end

  # Internal: Mock the call to the Slack client for user.
  #
  # Returns a struct that answers calls to .id and .name
  def self
    @self ||= Struct.new(:id, :name).new(@id, @name)
  end
end

# silence warnings about classes already initialized
silence_warnings do
  # Mock calls to slack
  Slack::Config = Struct.new(:token).new(nil)
  Slack::RealTime::Client = FakeSlackRubyClient
end
