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
    def add(c)
        @cards << c
    end

    # Easy
    def remove(c)
        @cards.delete(c)
    end

    def size
        cards.length
    end

    def empty
        ret = cards
        @cards = []
        ret
    end

    def royal_flush?
        # A K Q J 10, all same suit
        return false if ! all_same_suit?
        suit = @cards[0].suit
        matcher = [
            "Ace #{suit}", 
            "King #{suit}", 
            "Queen #{suit}", 
            "Jack #{suit}", 
            "10 #{suit}"
        ]
        matcher.all? {|m| self.include_by_string?(m)}
    end

    def straight_flush?
        # 5 in a row, same suit
    end

    def four_of_a_kind?
        # hand has 4 cards w same value
    end

    def full_house?
        # 3 of a kind + a pair
    end

    def flush?
        # 5 cards of same suit, but not in sequence
    end

    def straight?
        # 5 cards in sequence, not same suit
    end

    def three_of_a_kind?
        # 3 cards, same value
    end

    def two_pair?
        # 2 different pairs
    end

    def pair?
        # 2 cards, same value
    end

    def high_card?
        # none of the hands above, but has the highest card of remaining players
    end

    private

    def include_by_string?(str)
        cards.any? {|c| c.by_string(str)}
    end

    def all_same_suit?
        match = cards[0].suit
        cards.filter {|c| c.suit == match}.length == 5
    end

end