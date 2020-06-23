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

class InvalidActionError < ArgumentError

    attr_reader :code

    def initialize(code)
        @code = code
    end

    def message
        case code
        when :action
            "Please enter a valid action"
        when :poverty
            "You don't have enough money to see that bet"
        when :ambitious
            "You dont' have enough money to raise that much"
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
        @in_round = true
    end

    def deal_in(cards)
        @in_round = true
        receive(cards)
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
        cards
    end

    def get_discards
        begin
            puts "enter the indices of the cards you would like to discard"
            str = gets.chomp
            discard(parse_discards(str)) if str.length > 0
        rescue InvalidDiscardError => exception
            puts exception.message
            retry
        end
    end

    def process_action(str)
        Kernel::raise InvalidActionError.new(:action) if ! ["fold", "see", "raise"].include?(str)
        case str
        when "fold"
            fold
        when "see"
            if funds < game.bet - pot # helper method
                Kernel::raise InvalidActionError.new(:poverty)
            else
                see
            end
        when "raise"
            raise(get_raise)
        end
    end

    def take_action
        begin
            puts "Please enter the action you would like to take"
            puts "fold | see | raise"
            process_action(gets.chomp)
        rescue InvalidActionError => exception
            puts exception.message
            retry
        end
    end

    # private??

    def fold
        @game.dealer.discard(@hand.empty)
        @round_bet = 0
        @in_round = false
    end

    def see
        diff = game.bet - pot
        @pot += diff
        @funds -= diff
        game.see
    end

    def get_raise
        begin
            puts "What would you like to raise?"
            amt = gets.chomp.to_i
            Kernel::raise InvalidActionError.new(:ambitious) if game.bet + amt > funds
        rescue InvalidActionError => exception
            puts exception.message
            retry
        end

        amt
    end

    def raise(amt)
        game.raise(amt)
        self.see
    end

    def get_paid(winnings)
        
    end

    def end_hand
        @pot = 0
        @round_bet = 0
        @game.dealer.discard(@hand.empty)
        if funds == 0
            game.kill(self)
            @in_round = false
        end
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

# me = Player.new("Aaron", 1_000, "aGame")
# me.get_discards