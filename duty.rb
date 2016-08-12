class Duty < ActiveRecord::Base
    validates_uniqueness_of :username
    def evening_greeted
        update(morning_greeting: false,evening_greeting: true)
    end
    def morning_greeted
        update(morning_greeting: true, evening_greeting: false)
    end 
end


