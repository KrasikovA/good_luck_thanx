require_relative 'connection'
require 'telegram/bot'


class Duty < ActiveRecord::Base
end
p Duty.all
TOKEN = ENV['GOOD_LUCK_THANX']
time = Time.new
time_values = time.to_a
Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
	if time_values[2] > 20 and time_values[2] < 22 and !duty.greeted_evening
      		bot.api.send_message(chat_id: message.chat.id, text: "Удачи")
		duty.greeted_morning = false
		duty.greeted_evening = true
    	elsif time_values[2] > 8 and time_values[2] < 10 and !duty.greeted_morning
      		bot.api.send_message(chat_id: message.chat.id, text: "Спасибо")
		duty.greeted_morning = true
		duty.greeted_evening = false
    	end
  end
end
