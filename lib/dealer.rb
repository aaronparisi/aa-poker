require 'deck'

class Dealer
    # No test here since i-vars are not exposed via attr_*'s
    def initialize(deck, game)
        @deck, @game = deck, game
        @discards = []
        @first_deal_pos = 0
    end

    def play_round
        
    end

    # Two tests:
    # 1 - expect(deck).to receive(:deal_n) with n
    # 2 - expect(player).to receive(:recieve_cards) with cards
    # ( Test those methods individual in their respective classes )
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