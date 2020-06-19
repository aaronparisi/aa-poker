require 'rspec'
require 'deck'

describe Deck do
    describe "#initialize" do
        it "sets an array of cards"
        it "sets the appropriate suits/values?"
    end
    describe "#[]" do
        it "retreives the card at the passed in index"
        it "handles edge cases appropriately?"
    end

    describe "#[]=" do
        it "handles edge cases appropriately?"
    end

    describe "#size" do
        it "returns the length of the deck"
    end

    describe "#include?" do
        it "returns true if the card is in the deck"
        it "returns false if the card is not in the deck"
    end

    describe "#shuffle" do
        it "randomly shuffles the cards in the deck"
    end

    describe "#deal" do
        it "returns `n` cards"
        it "removes `n` cards from the deck"
    end

    describe "#empty" do
        it "empties the deck"
    end
end