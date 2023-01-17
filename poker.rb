class Card 
    attr_accessor :face, :suit  
    def initialize(face, suit) 
        @face = face
        @suit = suit
    end

end 

class Hand 
    def initialize(cards)
        @cards = cards
    end 

    def finish_draw(cards_to_discard, deck)
    cards_to_discard.each do |card|
        @cards.delete_at(card)
        end
    deck.shuffle!
    puts "Old cards: #{@cards}"
    new_cards = deck.take(cards_to_discard.count)
    puts "New cards: #{new_cards}"
    @cards = @cards + new_cards
    end

    def show_hand 
    @cards.each do |card|
        puts "#{card.face}#{card.suit}"
        end
    end 
        
    def show_hand_for_draw
    puts "Enter the number below to give up that card"
    @cards.each do |card|
        puts "#{card.face}#{card.suit}"
        end
    end
end 



class Poker 
    def initialize
        @game_over = false
        @deck = []
        ['2','3','4','5','6','7','8','9','10','J','Q','K','A'].each do |face|
        ['C', 'D', 'H', 'S'].each do |suit|
        @deck.push(Card.new(face, suit))
            end 
        end
        @deck = @deck.shuffle!
        @player_hand = Hand.new(@deck.take(5))
        @dealer_hand = Hand.new(@deck.take(5))
        @player_hand.show_hand

        while !@game_over
            puts "What would you like to do? (stand or draw?)"
            user_input = gets.chomp
            if user_input == "stand"
                @game_over = true
            elsif user_input == "draw"
                draw
            else 
                puts "Invalid input"
            end
        end
    end 

    def draw 
        puts "How many cards would you like to give up?"
        number_of_new_cards = gets.chomp.to_i
        cards_to_discard = []
        count = 0
        while count < number_of_new_cards 
            @player_hand.show_hand_for_draw
            discard = gets.chomp.to_i
            cards_to_discard.push(discard)
            @player_hand.finish_draw(cards_to_discard, @deck)


    
        end
    end 
end 

Poker.new