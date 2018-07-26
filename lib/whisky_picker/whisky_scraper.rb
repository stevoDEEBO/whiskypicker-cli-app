require 'nokogiri'
require 'open-uri'
require 'pry'

class WhiskyPicker::Whisky_scraper

  #scrape whisky type index page for name and url of whiskies
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    whisky_array = []
    whiskies = doc.css("")
    whiskies.each do |whisky|
      whisky = {
        :name => whisky.css(".item a.information.name").text,
        :profile_url => whisky.css(".item a").attribute("href").value
      }
      whisky_array << whisky
      binding.pry
    end
    whisky_array
  end
end
