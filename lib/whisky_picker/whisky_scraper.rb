require 'nokogiri'
require 'open-uri'
require 'pry'

class WhiskyPicker::Whisky_scraper
  attr_accessor :name, :profile_url, :region_type, :proof, :rating, :description

  #scrape whisky type index page for name and url of whiskies
  def self.scrape_index_page(index_url)
    whiskies = []
    doc = Nokogiri::HTML(open(index_url))

    whisky_time = doc.css(".item")
    whisky_time.each do |whisky|
      my_whisky = self.new
      my_whisky.name = whisky.css("a").attribute("title").text.strip
      my_whisky.profile_url = whisky.css("a").attribute("href").value
      whiskies << my_whisky
    end
    whiskies
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))

    my_whisky = self.new
    my_whisky.name = profile.css("name-container h1").text.strip
    my_whisky.region_type = profile.css(".name-container.properties li")[0].text.strip
    my_whisky.proof = profile.css(".strength").text.split(" / ")[1].strip
    my_whisky.rating = profile.css(".rating-stars-link").text.split("-").last.strip
    my_whisky.description = profile.css(".details-content-item").text.strip

    my_whisky
  end

end
  
