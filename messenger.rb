require 'flickraw'
class Messenger 
    HELP = "/add_duty - adds new user to mailing list\n/say_good_luck - says good luck to everyone\n/say_thanx - says thank you to everyone"
    PER_PAGE = 100
    PAGES_ALL = 1000
    def initialize(bot, chat_id)
        @bot = bot
        @chat_id = chat_id
	FlickRaw.api_key=ENV["FLICKR_KEY"] 
	FlickRaw.shared_secret=ENV["FLICKR_SECRET"]

    end

    def say(text)
        @bot.api.send_message(chat_id: @chat_id, text: text)
    end
    def show
	page_random = Random.new().rand(1..PAGES_ALL)
	on_page_random = Random.new().rand(0..PER_PAGE - 1)
	image = flickr.groups.pools.getPhotos(group_id: '661812@N25',extras: 'url_c',per_page: PER_PAGE.to_s, page: page_random.to_s)[on_page_random]
        @bot.api.send_message(chat_id: @chat_id, text: image.url_c )	    
    end
end
