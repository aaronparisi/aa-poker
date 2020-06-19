require 'card'

class Hand

    attr_reader :cards

    # Yep. expect(hand.cards).to be_empty
    def initialize
        @cards = []
    end 
    
    # Easy
    def include?(c)
        cards.include?(c)
    end

    # Easy
    def remove(c)
        @cards.delete(c)
    end

    # Easy
    def add(c)
        @cards << c
    end
end