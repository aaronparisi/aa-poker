require_relative 'deck'

class Dealer

    attr_reader :discards, :deck, :game
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
    end

    # Two tests:
    # 1 - expect(deck).to receive(:deal_n) with n
    # 2 - expect(player).to receive(:recieve_cards) with cards
    # ( Test those methods individual in their respective classes )
    def deal
        game.active_players.each {|p| p.deal_in(@deck.deal(5))}
    end

    def take_bets
        game.reset_bet
        game.in_round.each do |p|
            p.show_stats
            p.take_action
        end
    end

    def take_discards
        game.in_round.each do |p|
            p.show_stats
            trash = p.get_discards
            discard(trash)
            p.receive(@deck.deal(trash.length))
        end
    end

    def discard(cards)
        @discards.concat(cards)
    end

    def award_winner
        winner = game.in_round.sort_by {|p| p.show_hand.hand_value}.last
        winner.get_paid(game.pot)
        game.active_players.each {|p| p.end_hand}
        game.end_hand
    end
end