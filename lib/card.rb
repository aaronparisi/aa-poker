class Card

    attr_reader :value, :suit

    # Simple test for attribute values
    def initialize(value, suit)
        @value = value
        @suit = suit
    end
end