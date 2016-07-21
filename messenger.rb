class Messenger 
    HELP = "/add_duty - adds new user to mailing list\n/say_good_luck - says good luck to everyone\n/say_thanx - says thank you to everyone"
    def initialize(bot, chat_id)
        @bot = bot
        @chat_id = chat_id 
    end

    def say(text)
        @bot.api.send_message(chat_id: @chat_id, text: text)
    end
    def show(photo_path,photo_type)
        @bot.api.send_photo(chat_id: @chat_id, photo: Faraday::UploadIO.new(photo_path, photo_type))	    
    end
end
