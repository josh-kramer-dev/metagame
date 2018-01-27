class Metagame::CLI
  attr_reader :name, :price, :meta_percent, :url, :format

  def initialize
    @format = nil
  end

  def call
    get_format_from_user
    menu
    goodbye
  end

  def get_format_from_user
  	get_format_list
    list_formats_to_user
    set_format_to_user_input
    list_decks
  end

  def get_format_list
    @format_list = Metagame::Deck.scrape_for_list_of_formats
  end

  def list_formats_to_user
    puts "\nWhich format would you like more info on?"
  	@format_list.each.with_index(1) do |name, i|
  	   puts "#{i}. #{name}"
  	end
  end

  def set_format_to_user_input
  	input = gets.strip.to_i-1
  	@format = @format_list[input]
  end

  def list_decks
    puts "\n#{@format} metagame:\n-------------------\n"
    @decks = Metagame::Deck.scrape_format(@format.downcase)
    @decks.each.with_index(1) do |deck, i|
       puts "\n#{i}. #{deck[:name]} - #{deck[:meta_percent]} of Meta"
     end
   end

  def reload_format
   list_formats_to_user
   set_format_to_user_input
   list_decks
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nOPTIONS\n--------\nEnter the number for the deck you would like to view\nType list to see the decks again\nType format to pick your format\nType exit.\n"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= @decks.length
          the_deck = @decks[input.to_i-1]
          puts "\n#{the_deck[:name]}\n#{the_deck[:price]}\n#{the_deck[:meta_percent]} of Meta\nhttps://www.mtggoldfish.com#{the_deck[:url]}"
        elsif input == "list"
          list_decks
          # @format == "standard" ? list_standard_meta : list_modern_meta
        elsif input == "format"
          reload_format
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
