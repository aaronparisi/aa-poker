require 'card'

class Player

    attr_reader :hand, :name, :pot, :funds, :game

    def initialize(name, funds, game)
        @name, @funds, @game = name, funds, game
        @pot = 0
        @hand = []
        @round_bet = 0
    end

    def receive_cards(cards)
        cards.each {|c| @hand << c}
    end

    def show_hand
        hand
    end

    def discard(cards)
        cards.each do |c|
            @hand.delete(c)
        end
        game.dealer.discard(cards)
    end

    def take_action
        
    end

    # private??

    def fold
        @game.dealer.discard(hand)
        @hand = []
        @round_bet = 0
    end

    def see
        diff = game.bet - pot
        @pot += diff
        @funds -= diff
        game.see
    end

    def raise(amt)
        game.raise(amt)
        self.see
    end


end