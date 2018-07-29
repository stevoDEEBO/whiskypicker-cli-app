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

    whisky_time = profile.css(".container")

    my_whisky = self.new
    my_whisky.name = whisky_time.css(".name-container h1").text.strip
    my_whisky.region_type = whisky_time.css(".name-container ul.properties li").text
    my_whisky.proof = whisky_time.css(".name-container.strength")#.text.split(" / ").last
    my_whisky.rating = whisky_time.css(".subcontainer.action.rating-overview.rating-container.rating-stars-link.rating-value")#.text.split("-")
    my_whisky.description = whisky_time.css(".details-content-item").text.lines[1].strip

    my_whisky
    #binding.pry
  end

end
  
