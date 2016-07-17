require_relative 'connection'
require 'telegram/bot'


class Duty < ActiveRecord::Base
	validates_uniqueness_of :username
end

TOKEN = ENV['GOOD_LUCK_THANX']
time = Time.new
time_values = time.to_a
is_response = false
Telegram::Bot::Client.run(TOKEN) do |bot|  
 bot.listen do |message|
	if is_response
                if Duty.new(username: message.text).valid?
			Duty.new(username: message.text)
                        bot.api.send_message(chat_id: message.chat.id, text: "Дежурный #{message.text} успешно создан")
                else
                        bot.api.send_message(chat_id: message.chat.id, text: "Кажется пользователь #{message.text} уже существует")
                end
                is_response = false
        end
	if message.text == '/add_duty' and !is_response
		bot.api.send_message(chat_id: message.chat.id, text: "Введите username дежурного") 
		is_response = true
	elsif message.text == '/help' 
		bot.api.send_message(chat_id: message.chat.id, text: "/add_duty - adds new user to mailing list")
	else
		current_duty = Duty.find_by(username: message.from.username)
		if current_duty
			if time_values[2] > 20 and time_values[2] < 22 and !current_duty.evening_greeting and 
			  message.text =~ /(на смене|начал|на дежурстве|заступил)/i
      				bot.api.send_message(chat_id: message.chat.id, text: "Удачи")
				bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('images/cat_in_helmet.jpg', 'image/jpeg'))
				current_duty.update(morning_greeting: false)
				current_duty.update(evening_greeting: true)
    			elsif time_values[2] > 8 and time_values[2] < 10 and !current_duty.morning_greeting and 
			  message.text =~ /(закончил|окончил|завершил)/i
      				bot.api.send_message(chat_id: message.chat.id, text: "Спасибо")
				bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('images/sleepy_cat.jpg', 'image/jpeg'))
				current_duty.update(morning_greeting: true)
				current_duty.update(evening_greeting: false)
    			end
		end
	end
  end
end
