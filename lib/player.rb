require_relative 'hand'

class InvalidDiscardError < ArgumentError

    attr_reader :code

    def initialize(code)
        @code = code
    end

    def message
        case code
        when :delim
            "Please separate values with a single space"
        when :type
            "Please enter integers only"
        when :quant
            "Please enter 5 or fewer indices"
        when :range
            "Please select indeces between 0 and 4"
        end
    end
end

class Player

    attr_reader :hand, :name, :pot, :funds, :game

    def initialize(name, funds, game)
        @name, @funds, @game = name, funds, game
        @pot = 0
        @hand = Hand.new
        @round_bet = 0
    end

    def receive(cards)
        cards.each {|c| @hand.add(c)}
    end

    def show_hand
        hand.cards
    end

    def discard(cards)
        cards.each do |c|
            @hand.remove(c)
        end
        game.dealer.discard(cards)
    end

    def get_discards
        begin
            puts "enter the indices of the cards you would like to discard"
            str = gets.chomp
            discard(parse_discards(str))
        rescue InvalidDiscardError => exception
            puts exception.message
            retry
        end
    end

    def take_action
        
    end

    # private??

    def fold
        @game.dealer.discard(@hand.empty)
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

    def parse_discards(str)
        idxs = str.split(" ")
        if idxs.any? {|c| c.length > 1}
            Kernel::raise InvalidDiscardError.new(:delim)
        elsif ! idxs.all? {|c| "0123456789".include?(c)}
            Kernel::raise InvalidDiscardError.new(:type)
        elsif idxs.length > 5
            Kernel::raise InvalidDiscardError.new(:quant)
        elsif idxs.map(&:to_i).any? {|c| c > 4}
            Kernel::raise InvalidDiscardError.new(:range)
        end

        idxs
    end

end

me = Player.new("Aaron", 1_000, "aGame")
me.get_discards