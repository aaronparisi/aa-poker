require 'deck'

class Dealer

    attr_reader :discards
    # No test here since i-vars are not exposed via attr_*'s
    def initialize(game)
        @game = game
        @deck = Deck.new
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
        cards = @deck.deal(n)
        player.receive_cards(cards)
    end

    def request_actions
        
    end

    def request_discards
        
    end

    def discard(cards)
        @discards.concat(cards)
    end

    def award_winner
        
    end
end