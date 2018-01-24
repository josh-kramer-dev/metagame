
#menu method thoughts:
  #puts "Which format would you like to view metagame info for?"
  # input = gets.strip.downcase
  # if input = "standard"
  #   do this for the standard object
  # elsif input = "modern"
  #   do this for the modern object
  #   else
  #     puts "Please try again"
  #     list_format_meta


for future expansion to other formats:
def self.scrape_decks
  decks = []
    # go to the standand meta page
    # extract the decks
    #instantiate a new deck for each one scraped

  decks << self.scrape_standard
    # decks << self.scrape_modern ==> go through and build the other scrapers based on the other formats!

  decks
end
