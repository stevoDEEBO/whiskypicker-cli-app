#CLI Controller
class WhiskyPicker::CLI

#welcome user to gem and call list search options
  def call
    puts "Welcome to Whisky Picker...ready to pick yer whisky?"
    pick_whiskies
  end

#list search options by country of origin
  def pick_whiskies
    puts "Which country would you like to explore?"
    puts <<-DOC
    1. Scotch
    2. Irish
    3. American
    4. Japanese
    5. Canadian
    6. Other
    DOC
  end
end
