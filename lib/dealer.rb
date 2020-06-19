require 'deck'

class Dealer
    def initialize(deck, game)
        @deck, @game = deck, game
        @discards = []
        @first_deal_pos = 0
    end

    def play_round
        
    end

    def deal(player, n)
        cards = @deck.deal_n(n)
        player.receive_cards(cards)
    end

    def request_actions
        
    end

    def request_discards
        
    end

    def discard_cards
        
    end

    def award_winner
        
    end
end