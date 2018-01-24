class Metagame::CLI

  def call
    list_format_meta
    menu
    goodbye
  end

  def list_format_meta
    puts "Standard Metagame:"
    @decks = Metagame::Deck.today
    @decks.each.with_index(1) do |deck, i|
      puts "#{i}. #{deck.name} - #{deck.price} - #{deck.meta_percent}% of Meta - #{deck.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number for the deck you would like to view, type list to see the decks again, or type exit."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @decks.length
        the_deck = @decks[input.to_i-1]
        puts "#{the_deck.name} - #{the_deck.price} - #{the_deck.meta_percent} of Meta - #{the_deck.url}"
      elsif input == "list"
        list_format_meta
      else
        puts "Please try again by typing list or exit."
      end
    end
  end

  def goodbye
    puts "See you tomorrow!"
  end

end
