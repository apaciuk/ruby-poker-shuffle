require 'colorize'
require_relative 'card.rb'
require_relative 'hand.rb'  

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
        @player_hand.show_hand

        while !@game_over
            puts "What would you like to do? (stand or draw?)"
            status = gets.chomp
            if status == "stand"
                @game_over = true
                puts "Game over!" 
                @player_hand.show_hand
            elsif status == "draw"
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
            count += 1
            @player_hand.finish_draw(cards_to_discard, @deck)
            @player_hand.show_hand
        end
    end 
end 

Poker.new