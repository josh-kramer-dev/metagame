class Metagame::Deck
  attr_accessor :name, :price, :meta_percent, :url

  def self.scrape_for_list_of_formats
    doc = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard#paper"))

    formats ||= doc.search("div.subNav-menu-desktop a")
    list_of_formats = []
    formats.each do |name|
      list_of_formats << name.text.gsub(" ", "_")
      end
      list_of_formats.uniq
  end


  def self.scrape_format(format)
    doc = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/#{format}#paper"))
    deck_list ||= doc.search("div.archetype-tile")
    deck_list.collect do |deck|
      hash = {
        :name => deck.search("h2 span.deck-price-paper a").text,
        :price => deck.search("td.text-right span.deck-price-paper").text.gsub("\n", ""),
        :meta_percent => deck.search("td.percentage.col-freq").text.gsub("\n", ""),
        :url => deck.search("h2 span.deck-price-paper a").attribute("href").value,
      }
    end
  end

  def self.scrape_deck_list(deck_url)
    doc = Nokogiri::HTML(open("https://www.mtggoldfish.com#{deck_url}"))
    # binding.pry
    list_of_cards ||= doc.search("div.deck-view-decklist deck-view-decklist-compact")
    list_of_cards.collect do |deck|
    cards_in_deck = {
      :quantity => deck.search("td.deck-col-qty").text,
      :title => deck.search("td.deck-col-card a").text,
      :price => deck.search("td.deck-col-price").text,
    }
    end
    # cards_in_deck = [{:quantity => "4", :title =>"harnessed lightning", :price => "$2.50"}, {:quantity => "4", :title => "fatal push", :price => "$10.00"}]
    #
    # cards_in_deck
  end
end
