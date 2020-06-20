class Card

    attr_reader :value, :suit

    # Simple test for attribute values
    def initialize(value, suit)
        @value = value
        @suit = suit
    end

    def ==(info)
        v, s = info
        value == v && suit == s
    end
end