#CLI Controller
class WhiskyPicker::CLI

#welcome user to gem and call list search options
  def call
    pick_whiskies
    laters
  end

#list search options - leave open for now to expand by diff options- country, style, brand, etc
  def pick_whiskies
    puts "Welcome to Whisky Picker...ready to pick yer whisky?"
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
    country_menu
  end

#prompt user for country selection and show list of whiskies from selected country
  def country_menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the country to explore, list or type exit to leave:"
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
      else
        puts "Didn't quite catch that. Type countries or exit"
      end
    end
  end

  def scotch
    puts "Which type of Scotch would you like to explore?"
    puts <<-DOC
    1. Single Malt
    2. Blended Malt
    3. Blended
    4. Grain
    5. Organic
    DOC
    scotch_menu
  end

  def scotch_menu
    input = nil
    while input != "exit"
      puts "Please enter number of selection or type list or exit."
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
      when "5"
        scotch_organic
      when "list"
        scotch
      else
        puts "Didn't quite catch that. Type list or exit"
      end
    end
  end

  def scotch_single_malt
    puts "Let's explore single malt Scotch whiskies"
    #scrape and list all single malt scotches
  end

  def scotch_blended_malt
    puts "Let's explore blended malt Scotch whiskies"
    #scrape and list all blended malt scotches
  end

  def scotch_blended
    puts "Let's explore blended Scotch whiskies"
    #scrape and list all blended scotches
  end

  def scotch_grain
    puts "Let's explore grain Scotch whiskies"
    #scrape and list all grain scotches
  end

  def scotch_organic
    puts "Let's explore organic Scotch whiskies"
    #scrape and list all organic scotches
  end

  def irish
    puts "Let's explore the whiskies of Ireland"
    #scrape and list all Irish whiskies
  end

  def american
    puts "Let's explore the whiskies of the United States of America"
    #scrape and list all American whiskies
  end

  def japanese
    puts "Let's explore the whiskies of Japan"
    #scrape and list all Japanese whiskies
  end

  def canadian
    puts "Let's explore the whiskies of Canada"
    #scrape and list all Canadian whiskies
  end

  def other
    puts "Let's explore the whiskies of other countries"
    #scrape and list all other whiskies
  end


  def laters
    puts "Laters! Thanks for stopping by."
  end
end
