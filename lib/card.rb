class Card

    attr_reader :value, :suit

    # Simple test for attribute values
    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def ==(c)
        @value == c.value && @suit == c.suit
    end

    def by_string(str)
        v, s = str.split(" ")
        @value == v && @suit == s
    end

    def point_val
        case value
        when "Jack"
            return 11
        when "Queen"
            return 12
        when "King"
            return 13
        when "Ace"
            return 14
        else
            return value.to_i
        end
    end
end