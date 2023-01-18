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
    puts "Your hand is:"
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