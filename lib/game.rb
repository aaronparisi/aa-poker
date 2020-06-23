require 'dealer'

class Game

    attr_reader :active_players, :dealer

    attr_accessor :pot, :bet

    def initialize(players)
        @active_players = players
        @dead_players = []
        @dealer = Dealer.new(self)
        @pot = 0
        @bet = 0
    end

    def raise(amt)
        @bet += amt
    end

    def see
        @pot += bet
    end

    def in_round
        active_players.filter {|p| p.in_round}
    end

    def kill(player)
        @dead_players << player
        @active_players.delete(player)
    end

    def end_hand
        @pot = 0
        @bet = 0
    end

    # This method likely delegates to other objects to determine if game is over
    # I would stub out helper methods and test all possibilities. We can talk more
    # about this when you implement this
    def game_over?
        
    end

    # IMHO this is more of an integration test than a unit test. This is the whole
    # meat of the program, the proverbial `main` method. I would potentially pull
    # this out into its own spec file and maybe just walk through a whole game. Maybe...
    def play_game
        
    end
end