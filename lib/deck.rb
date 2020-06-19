require 'card'

class Deck

    attr_reader :cards

    def initialize()
        @cards
    end

    def [](pos)
        cards[pos]
    end

    def []=(pos, val)
        @cards[pos] = val
    end

    def size
        cards.length
    end

    def include?(val, suit)
        cards.any? {|c| c.value == val && c.suit == suit}
    end

    def shuffle
        
    end

    def deal_n(n)
        ret = []
        n.times do
            ret << @cards.shift
        end

        ret
    end

    def empty_it
        @cards = []
    end

    private

    def fill_deck
        # returns a complete deck of cards
        vals = (2..10).to_a.map {|v| v.to_s} + ["Jack", "Queen", "King", "Ace"]
        suits = ["Spades", "Clubs", "Diamonds", "Hearts"]

        suits.each do |suit|
            vals.each do |val|
                @cards << Card.new(val, suit)
            end
        end

    end
end