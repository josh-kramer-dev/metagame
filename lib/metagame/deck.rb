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

    decks << self.scrape_standard
      # decks << self.scrape_modern

    decks
  end

  def self.scrape_standard
    doc = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard#paper"))
    binding.pry

    # this one is going to be like the scrape_index_page one from the last project. Iterate over all these ones in this div class = clearfix section and each is a new deck

    # name = doc.search("h2 span.deck-price-paper a").text
    #url = "https://www.mtggoldfish.com"#{doc.search("h2 span.deck-price-paper a").attribute("href").value}""
    # price = doc.search("td.text-right span.deck-price-paper").text
    # meta_percent = doc.search("td.percentage.col-freq").text






  end

end
