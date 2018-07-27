How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects.
8. program

scrape from whisky type index pages:
  CLI tells scraper class to scrape whiskies from webpage
  CLI tells whisky class to create array of whiskies
  whisky class makes the whiskies into hashes with name & url and puts them into array to return to CLI

scrape from whisky profile pages:
  CLI tells scraper class to scrape whisky profile pages
  CLI tells whisky class to create profile attributes for whiskies
  CLI displays whisky profile info

CLI makes whisky
CLI adds profile attributes to whisky
CLI displays whisky profile

Whisky Picker - CLI Data Gem Proj

Welcome to Whisky Picker...ready to pick yer whisky?

##This is how it could be expanded later...
How would you like to search for a whisky today?
1. Country of origin
2. Brand name
3. Style (Whisky by Flavor page)
User types number of selected search method

For 1. Country of origin:


  Which whisky collection would you like to see?
  1. Scotch
  2. Irish
  3. American
  4. Japanese
  5. Canadian
  6. Other
  User types number of selected country

   if Scotch,
    Which type of Scotch would you like to explore?
    1. Single Malt
    2. Blended Malt
    3. Blended
    4. Grain
    5. Return to previous page
    User types number of selected type

    Shows numbered list of A-Z brands of selected country
    Last item in list: Return to previous list

    Which whisky would you like more info on?
    User types number of selected whisky

      Whisky info:
        Name
        Country
        Region
        Type
        Proof
        Customer rating
        Description
        Return to previous list
        Start Over
        Exit
