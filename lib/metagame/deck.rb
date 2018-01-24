class Metagame::Deck
  attr_accessor :name, :price, :meta_percent, :url

  def self.today
    self.scrape_decks
  end

  def self.scrape_decks
      decks = []
      # go to the standand meta page
      # extract the decks
      #instantiate a new deck for each one scraped
      


    decks

  end

end
