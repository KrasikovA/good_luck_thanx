require 'telegram/bot'
require_relative 'messenger'
require_relative 'duty'
class Server
    TOKEN = ENV['GOOD_LUCK_THANX']        
    def self.run
        is_response = false
	Telegram::Bot::Client.run(TOKEN) do |bot| 
            bot.listen do |message|
                message_text = message.text
                messenger = Messenger.new(bot,message.chat.id)
                if is_response
		   create_duty(message_text,messenger)
                   is_response = false  
		else
		    if message_text == '/add_duty' and !is_response
                        messenger.say('Введите username дежурного')
			is_response = true  
		    elsif message_text == '/help'
			messenger.say(Messenger::HELP)
	            elsif message_text == '/say_thanx'
			messenger.say('Спасибо')
                        messenger.show
	            elsif message_text == '/say_good_luck'
			messenger.say('Удачи')
                        messenger.show
	            else
			if current_duty = Duty.find_by(username: message.from.username)
			    yield message,messenger,current_duty
                        end
	            end
		end
            end
	end 	
    end 

    private
    def self.create_duty(name, messenger)
        if Duty.new(username: name).valid?
	    Duty.create(username: name)
            messenger.say("Дежурный #{name} успешно создан")
        else
            messenger.say("Кажется пользователь #{name} уже существует")
        end
    end
end


