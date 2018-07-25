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
      puts "Please enter the number of the country to explore or type exit to leave:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Let's explore Scotland"
      when "2"
        puts "Let's explore Ireland"
      when "3"
        puts "Let's explore the United States of America"
      when "4"
        puts "Let's explore Japan"
      when "5"
        puts "Let's explore Canada"
      when "6"
        puts "Let's explore other countries"
#      when "exit"
#        laters
#      else
#        puts "Didn't quite catch that..."
#        countries
      end
    end
  end

  def laters
    puts "Laters! Thanks for stopping by."
  end
end
