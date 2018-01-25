class Metagame::CLI
  attr_reader :name, :price, :meta_percent, :url, :format

  def initialize
    @format = nil
  end

  def call
    pick_format
    menu
    goodbye
  end

  def pick_format
    puts "Which format would you like to view? Standard or Modern?"
    input = nil
    input = gets.strip.downcase
    if input == "standard"
      @format = "standard"
      list_standard_meta
    elsif input == "modern"
      @format = "modern"
      list_modern_meta
    else
      puts "Gotta pick one or the other... You can do it!"
      pick_format
    end
  end

  # def list_standard_meta
  #   puts "\nStandard Metagame:\n------------------\n"
  #   @decks = Metagame::Deck.scrape_standard
  #   @decks.each.with_index(1) do |deck, i|
  #     puts "\n#{i}. #{deck[:name]} - #{deck[:meta_percent]} of Meta"
  #   end
  # end

  def list_modern_meta
    puts "\nModern Metagame:\n------------------\n"
    @decks = Metagame::Deck.scrape_modern
    @decks.each.with_index(1) do |deck, i|
      puts "\n#{i}. #{deck[:name]} - #{deck[:meta_percent]} of Meta"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nOPTIONS\n--------\nEnter the number for the deck you would like to view\nType list to see the decks again\nType format to pick your format\nType exit."
      input = gets.strip.downcase

        if input.to_i > 0 && input.to_i <= @decks.length
          the_deck = @decks[input.to_i-1]
          puts "\n#{the_deck[:name]} - #{the_deck[:price]} - #{the_deck[:meta_percent]} of Meta - https://www.mtggoldfish.com#{the_deck[:url]}"
        elsif input == "list"
          @format == "standard" ? list_standard_meta : list_modern_meta
        elsif input == "format"
          pick_format
        elsif input == "exit"
          nil
        else
          puts "Please try again by picking a deck, or by typing list, format, or exit."
        end
    end
  end

  def goodbye
    puts "See you tomorrow!"
  end

end
