require 'nokogiri'
require 'open-uri'
require 'pry'

class WhiskyPicker::Whisky_scraper

  #scrape whisky type index page for name and url of whiskies
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    whisky_array = []
    whiskies = doc.css(".item")
    whiskies.each do |whisky|
      whisky = {
        :name => whisky.css("a").attribute("title").text.strip,
        :profile_url => whisky.css("a").attribute("href").value
      }
      whisky_array << whisky
    end
    whisky_array
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))
    whisky = {}

    whisky[:name] = profile.css("").text.strip
    whisky[:region] = profile.css("").text.strip
    whisky[:type] = profile.css("").text.strip
    whisky[:proof] = profile.css("").text.strip
    whisky[:rating] = profile.css("").text.strip
    whisky[:description] = profile.css("").text.strip
  end

end
