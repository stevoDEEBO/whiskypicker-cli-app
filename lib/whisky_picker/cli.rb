require 'pry'
require_relative "whisky_scraper.rb"
require_relative "whisky.rb"
require 'colorize'



#CLI Controller
class WhiskyPicker::CLI

  #include base path to append urls of respective whisky type webpages
  BASE_PATH = "https://www.thewhiskyexchange.com/"

#welcome user to gem and call list search options
  def call
    greet
    pick_whiskies
    #menu
    #laters
  end

#greet user
  def greet
    puts "Welcome to Whisky Picker...ready to pick yer whisky?"
  end

#list search options - can expand later by diff options- country, style, brand, etc
  def pick_whiskies
    countries
  end

#list search options by country of origin
  def countries
    puts "Which country would you like to explore?"
    puts <<-DOC
    1. Scotland
    2. Ireland
    3. United States of America
    4. Japan
    5. Canada
    6. Other countries
    DOC
    country_list
  end

#prompt user for country selection and call country method
  def country_list
    input = nil
    while input != "exit"
      puts "Please enter the number of desired country or type list or exit to leave:"
      input = gets.strip.downcase
      case input
      when "1"
        scotch
      when "2"
        irish
      when "3"
        american
      when "4"
        japanese
      when "5"
        canadian
      when "6"
        other
      when "list"
        countries
      when "exit"
        laters
      else
        puts "Didn't quite catch that, type list or exit to leave."
      end
    end
  end

#scotch section has an additional drill down by type of scotch in order to find list of scotch whiskies
#list search options by type of scotch whiskies here
  def scotch
    puts "Which type of Scotch would you like to explore?"
    puts <<-DOC
    1. Single Malt
    2. Blended Malt
    3. Blended
    4. Grain
    DOC
    scotch_type_list
  end

#prompt user for desired type of scotch whisky selection and call scotch whisky type method
  def scotch_type_list
    input = nil
    while input != "exit"
      puts "Please enter the number of desired type of scotch or type list, back or exit to leave."
      input = gets.strip.downcase
      case input
      when "1"
        scotch_single_malt
      when "2"
        scotch_blended_malt
      when "3"
        scotch_blended
      when "4"
        scotch_grain
      when "list"
        scotch
      when "back"
        countries
      when "exit"
        laters
      else
        puts "Didn't quite catch that, type list or exit to leave."
      end
    end
  end

  #show list of single malt Scotch whiskies
  def scotch_single_malt
    puts "Let's explore single malt Scotch whiskies"
    #call method to list whiskies for this particular type
    list_whiskies('c/40/single-malt-scotch-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of blended malt Scotch whiskies
  def scotch_blended_malt
    puts "Let's explore blended malt Scotch whiskies"
    #call method to list whiskies for this particular type
    list_whiskies('c/309/blended-malt-scotch-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of blended Scotch whiskies
  def scotch_blended
    puts "Let's explore blended Scotch whiskies"
    #call method to list whiskies for this particular type
    list_whiskies('c/304/blended-scotch-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of grain Scotch whiskies
  def scotch_grain
    puts "Let's explore grain Scotch whiskies"
    #call method to list whiskies for this particular type
    list_whiskies('c/310/grain-scotch-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of Irish whiskies
  def irish
    puts "Let's explore the whiskies of Ireland"
    #call method to list whiskies for this particular type
    list_whiskies('c/32/irish-whiskey?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of American whiskies
  def american
    puts "Let's explore the whiskies of the United States of America"
    #call method to list whiskies for this particular type
    list_whiskies('c/33/american-whiskey?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of Japanese whiskies
  def japanese
    puts "Let's explore the whiskies of Japan"
    #call method to list whiskies for this particular type
    list_whiskies('c/35/japanese-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of Canadian whiskies
  def canadian
    puts "Let's explore the whiskies of Canada"
    #call method to list whiskies for this particular type
    list_whiskies('c/34/canadian-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #show list of whiskies from other countries
  def other
    puts "Let's explore the whiskies of other countries"
    #call method to list whiskies for this particular type
    list_whiskies('c/305/rest-of-the-world-whisky?filter=true&rfdata=~size.76#productlist-filter')
  end

  #display list of all scraped selected whiskies using array indices and hash key 'name'
  def list_whiskies(whisky_url)
    #scrape and and create array of whisky hashes for all selected whiskies using url
    @whiskies = WhiskyPicker::Whisky_scraper.scrape_index_page(BASE_PATH + whisky_url)
    #display list of whiskies
    @whiskies.each_with_index do |whisky, index|
      puts "#{index+1}. #{whisky.name}"
    end
    menu
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Please enter the number of the particular whisky you would like info on."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < @whiskies.size
        whisky = @whiskies[input.to_i-1]

        #have scraper scrape profile page for selected whisky
        whisky_prof = WhiskyPicker::Whisky_scraper.scrape_profile_page(BASE_PATH + whisky.profile_url )

        #display selected whisky profile info
        puts "Name: " + "#{whisky_prof.name}".upcase.colorize(:red)
        puts ""
        puts "Country: " + "#{whisky_prof.country}"
        puts "Region & Type: " + "#{whisky_prof.region_type}"
        puts "Proof: " + "#{whisky_prof.proof}"
        puts "Customer rating: " + "#{whisky_prof.rating}"
        puts "Description: " + "#{whisky_prof.description}"
        puts ""
        puts ""
        puts "Want to pick another one? Type list to start over or exit to leave."
#binding.pry
        input = gets.strip.downcase
        if input == "list"
          pick_whiskies
        elsif input == "exit"
          laters
          exit
        else
          puts "Didn't quite catch that, type list or exit to leave."
        end
      end
    end
  end

  def laters
    puts "Laters! Thanks for stopping by."
    exit
  end
end
