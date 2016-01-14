require_relative './config/environment'

def reload!
  load_all './lib'
end

task :console do
  Pry.start
end

task :scrape_rooms do
  # instantiate a scraper, and then have it find new rooms
  nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo')
  nyc_scraper.call
  chicago_scraper = RoomScraper.new('https://chicago.craigslist.org/search/roo')
  chicago_scraper.call
  # london_scraper = RoomScraper.new("http://london.craigslist.co.uk/search/roo")
  # london_scraper.call
  # after this method call, I should be ablet o say Room.all and have rooms there.
end
