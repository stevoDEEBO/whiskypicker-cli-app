#CLI Controller
class WhiskyPicker::CLI

#welcome user to gem and call list search options
  def call
    pick_whiskies
  end

#list search options - leave open for now to expand by diff options- country, style, brand, etc
  def pick_whiskies
    puts "Welcome to Whisky Picker...ready to pick yer whisky?"
    countries
  end

#list search options by country of origin
  def countries
    puts "Which country would you like to explore? Please enter number of selection."
    puts <<-DOC
    1. Scotch
    2. Irish
    3. American
    4. Japanese
    5. Canadian
    6. Other
    DOC
    country_menu
  end

  def country_menu
    
  end
end
