require 'deck'

class Dealer

    attr_reader :discards, :deck
    # No test here since i-vars are not exposed via attr_*'s
    def initialize(game)
        @game = game
        @deck = Deck.new
        @discards = []
        @first_deal_pos = 0
    end

    def reset_deck
        discards.each {|c| @deck.add(c)}
        @discards = []
        @deck.shuffle
    end

    def play_round

        reset_deck

        deal

        take_bets

        take_discards

        take_bets

        award_winner

        end_hand
    end

    # Two tests:
    # 1 - expect(deck).to receive(:deal_n) with n
    # 2 - expect(player).to receive(:recieve_cards) with cards
    # ( Test those methods individual in their respective classes )
    def deal
        game.active_players.each {|p| p.deal_in(@deck.shift(5))}
    end

    def take_bets
        game.in_round.each {|p| p.take_action}
    end

    def take_discards
        game.in_round.each {|p| discard(p.get_discards)}
    end

    def discard(cards)
        @discards.concat(cards)
    end

    def award_winner
        winner = game.in_round.sort_by(&:hand.hand_value).last
        winner.get_paid(game.pot)
        active_players.each {|p| p.end_hand}
        game.end_hand
    end
end