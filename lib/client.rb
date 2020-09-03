require_relative './bot'

class Client < Bot
  attr_reader :running

  @running = false
  @token = nil

  def initialize(token)
    @token = token
  end

  def start
    Telegram::Bot::Client.run(@token) do |bot|
      @running = true
      @@telegram_instance = bot
      yield(running)
      bot.listen do |message|
        respond(message)
      end
    end
  end
end

