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
end