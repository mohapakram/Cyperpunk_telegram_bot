require 'telegram/bot'

class Bot
  @@telegram_instance = nil
  @user_name = nil
  @chat_id = nil
  @text = nil

  private
  
  def respond(message)
    @user_name = message.from.first_name
    @chat_id = message.chat.id
    @text = message.text 
    
    case @text
    when '/start'
      introduce_yourself
    when 'yes'
      share_something
    when 'next'
      share_something
    when '/stop'
      say_bye
    else
      explain_yourself
     end
  end

  def introduce_yourself
    type "Hello, #{@user_name}. my name is Cyberpunk and like Cyberpunk, the game of course .. would you like to know more about it? Say yes if you do and I will send you random videos about the game :D"
  end

  def say_bye
    type "Bye, #{@user_name}"
  end

  def explain_yourself
    type "Sorry, I don't understand alot of words right now. do you want to know more about Cyberpunk? Say yes if you do and I will send you random videos about the game :D and say /stop end the chat"
  end

  def share_something
    videos = [
      'https://www.youtube.com/watch?v=Q4ON7H7RnBE',
      'https://www.youtube.com/watch?v=1VZaIG5WZH0',
      'https://www.youtube.com/watch?v=Do51eJowSyg',
      'https://www.youtube.com/watch?v=VOXOdflScCY',
      'https://www.youtube.com/watch?v=ToWfeUEAeeQ',
      'https://www.youtube.com/watch?v=E7dKVCw7bkE',
      'https://www.youtube.com/watch?v=aWbQ5WcB0m4'
    ]

    type videos[rand(6)]
  end

  def type(message)
    @@telegram_instance.api.send_message(chat_id: @chat_id, text: message)
    rescue StandardError => e
      puts e.message
    end
end
