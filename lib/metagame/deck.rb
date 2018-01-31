class Metagame::Deck
  attr_accessor :name, :price, :meta_percent, :url

  def self.scrape_for_list_of_formats
    doc = Nokogiri::HTML(open("https://www.mtggoldfish.com/metagame/standard#paper"))

    formats ||= doc.search("div.subNav-menu-desktop a")
      formats.collect do |name|
        name.text.gsub(" ", "_")
      end

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

end
