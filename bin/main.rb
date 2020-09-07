require 'dotenv/load'
require_relative '../lib/client'

cyberpunk = Client.new(ENV['TOKEN'])

cyberpunk.start do |is_running|
  puts 'Bot is running ...' if is_running
end
