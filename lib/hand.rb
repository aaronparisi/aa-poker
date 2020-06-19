require 'card'

class Hand

    attr_reader :cards

    def initialize
        @cards = []
    end

    def include?(c)
        cards.include?(c)
    end

    def remove(c)
        @cards.delete(c)
    end

    def add(c)
        @cards << c
    end
end