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
    puts "Which format would you like to view?\n1. Standard \n2. Modern \n3. Pauper \n4. Legacy \n5. Vintage \n6. Frontier \n7. Commander 1v1 \n8. Commander \n9. Tiny Leaders"
    input = nil
    input = gets.strip.to_i
      case input
      when 1
        @format = "Standard"
      when 2
        @format = "Modern"
      when 3
        @format = "Pauper"
      when 4
        @format = "Legacy"
      when 5
        @format = "Vintage"
      when 6
        @format = "Frontier"
      when 7
        @format = "Commander_1v1"
      when 8
        @format = "Commander"
      when 9
        @format = "Tiny_leaders"
      else
        puts "Please try again"
        pick_format
      end
    list_format
  end

  def list_format
    puts "/n #{@format} metagame:\n-------------------\n"
    @decks = Metagame::Deck.scrape_format(@format.downcase)
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
          list_format
          # @format == "standard" ? list_standard_meta : list_modern_meta
        elsif input == "format"
          pick_format
        elsif input == "exit"
          nil
        else
          puts "Please pick a deck, or type list, format, or exit."
        end
    end
  end

  def goodbye
    puts "See you tomorrow!"
  end

end
