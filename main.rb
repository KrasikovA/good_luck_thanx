require_relative 'connection'
require_relative 'server'
EVENING_GREETING_START = 20
EVENING_GREETING_END = 23
MORNING_GREETING_START = 8
MORNING_GREETING_END = 10

Server.run do |message, messenger, current_duty|
	time = Time.new
	time_values = time.to_a
	if time_values[2] >= EVENING_GREETING_START and time_values[2] <= EVENING_GREETING_END and !current_duty.evening_greeting and 
	  message.text =~ /(смене|начал|дежурстве|заступил)/i
		messenger.say("Удачи")
		messenger.show('images/cat_in_helmet.jpg', 'image/jpeg')
		current_duty.evening_greeted
	elsif time_values[2] >= MORNING_GREETING_START and time_values[2] <= MORNING_GREETING_END and !current_duty.morning_greeting and 
	  message.text =~ /(закончил|окончил|завершил)/i
	    messenger.say("Спасибо")
            messenger.show("images/sleepy_cat.jpg","image/jpeg")
            current_duty.morning_greeted    
	else
            p "No message because: current time #{time_values[2]}\nduty was greeted morning #{current_duty.morning_greeting}\nduty was greeted evening #{current_duty.evening_greeting}\nevening pattern match #{message.text =~ /(смене|начал|дежурстве|заступил)/i}\nmorning pattern match #{message.text =~ /(закончил|окончил|завершил)/i}"
        end

end

