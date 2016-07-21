require_relative 'connection'
require_relative 'server'
EVENING_GREETING_START = 20
EVENING_GREETING_END = 22
MORNING_GREETING_START = 8
MORNING_GREETING_END = 10
time = Time.new
time_values = time.to_a
Server.run do |message, messenger, current_duty|
 	if time_values[2] > EVENING_GREETING_START and time_values[2] < EVENING_GREETING_END and !current_duty.evening_greeting and 
	  message.text =~ /(на смене|начал|на дежурстве|заступил)/i
		messenger.say("Удачи")
		messenger.show('images/cat_in_helmet.jpg', 'image/jpeg')
		current_duty.evening_greeted
	elsif time_values[2] > MORNING_GREETING_START and time_values[2] < MORNING_GREETING_END and !current_duty.morning_greeting and 
	  message.text =~ /(закончил|окончил|завершил)/i
	    messenger.say("Спасибо")
            messenger.show("images/sleepy_cat.jpg","image/jpeg")
            current_duty.morning_greeted    
	end

end

