require 'card'

class Hand < Array

    attr_reader :cards

    # Yep. expect(hand.cards).to be_empty
    def initialize
        
    end 
    
    # # Easy
    # def include?(c)
    #     cards.include?(c)
    # end

    # # Easy
    # def remove(c)
    #     @cards.delete(c)
    # end

    # # Easy
    # def add(c)
    #     @cards << c
    # end

    # def size
    #     cards.length
    # end

    # def discard
    #     ret = cards
    #     @cards = []
    #     ret
    # end
end