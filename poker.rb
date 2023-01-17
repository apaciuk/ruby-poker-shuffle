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

    def show_hand 
    @cards.each do |card|
        puts "#{card.face} of #{card.suit}"
    end
    end
end 



class Poker 
    def initialize 
        @game_over = false
        @deck = []
        ['2','3','4','5','6','7','8','9','10','J','Q','K','A'].each do |face|
        ['clubs', 'diamonds', 'hearts', 'spades'].each do |suit|
        @deck.push(Card.new(face, suit))
            end 
        end
        @deck = @deck.shuffle!
        @player_hand = Hand.new(@deck.take(5))
        @dealer_hand = Hand.new(@deck.take(5))
        @player_hand.show_hand

        while !@game_over
        end
    end
end 

Poker.new