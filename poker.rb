class Card 
    attr_accessor :face, :suit
    def initialize(face, suit) 
        @face = face
        @suit = suit
    
    end

end


class Poker 
    def initialize 
        @deck = []
        @suits = ['clubs', 'diamonds', 'hearts', 'spades']
        @faces = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
        @suits.each do |suit|
            @faces.each do |face|
                @deck << Card.new(face, suit)
            end
        end
        @deck.shuffle!
        puts @deck.inspect

    end

end 

Poker.new