class Duty < ActiveRecord::Base
    validates_uniqueness_of :username
    def evening_greeted
        update(morning_greeting: false)
        update(evening_greeting: true)
    end
    def morning_greeted
        update(morning_greeting: true)
	update(evening_greeting: false)
    end 
end


