class Metagame::CLI

  def call
    list_format_meta
    menu
    goodbye
  end

  def list_format_meta
    puts "Standard Metagame:"
    puts <<-DOC
      1. Grixis Energy - $301 - 14.40% of Meta
      2. Mardu Vehicles - $233 - 8.80% of Meta
      DOC
    # puts "Modern Metagame:"
    # puts <<-DOC
    #   1.  Affinity - $726 - 7.57% of Meta
    #   2.  Jeskai Control - $1,162 - 7.35% of Meta
    #   DOC
    @decks = Metagame::Deck.today
  end

  def menu
    # puts "Which format would you like to view metagame info for?"
    # input = gets.strip.downcase
    # if input = "standard"
    #   do this for the standard object
    # elsif input = "modern"
    #   do this for the modern object
    #   else
    #     puts "Please try again"
    #     list_format_meta
    input = nil
    while input != "exit"
      puts "Enter the number for the deck you would like to view, list to see the decks again, or type exit."

      input = gets.strip.downcase
      if input == "1"
        puts "More info on Deck 1..."
      elsif input == "2"
        puts "More info on Deck 2"
      elsif input == "list"
        list_format_meta
      else
        puts "Please try again by typing list or exit."
        list_format_meta
      end
    end
  end

  def goodbye
    puts "See you tomorrow!"
  end

end
