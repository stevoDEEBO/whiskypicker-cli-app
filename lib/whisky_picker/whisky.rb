require 'nokogiri'
require 'open-uri'
require 'pry'

class WhiskyPicker::Whisky
  attr_accessor :name, :profile_url, :country, :region_type, :proof, :rating, :description

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



    #my_whisky.country = whisky_time.css("dl.meta").children[3].text  if whisky_time.css("dl.meta").children[3] != nil

#for whisky_time.css("dl.meta").children[n].text == "Country" return whisky_time.css("dl.meta").children[n+1].text
    my_whisky.country_list = whisky_time.css("dl.meta")
    my_whisky.country_list.each do |i|
      if whisky_time.css("dl.meta").children[i].text == "Country"
        my_whisky.country = my_whisky.children[i+1].text
      else
        my_whisky.country = ""
      end
    end





    my_whisky.region_type = whisky_time.css("ul.properties li").text if whisky_time.css("ul.properties li") != nil
    my_whisky.proof = whisky_time.css("span.strength").text.split(" / ").last #if my_whisky.proof != nil
    my_whisky.rating = whisky_time.at("//span[@itemprop = 'ratingValue']").text if whisky_time.at("//span[@itemprop = 'ratingValue']") != nil
    my_whisky.description = whisky_time.css(".details-content-item").text.lines[1].strip #if my_whisky.description != nil

    my_whisky
    #binding.pry
  end

end
