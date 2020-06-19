require 'rspec'
require 'player'

describe Player do
    describe "#receive_cards" do
        it "accepts an array of valid card objects"
        it "adds the cards to the player's hand"
    end

    describe "#reveal_hand" do
        it "returns the player's hand"
    end

    describe "#discard" do
        it "removes the corresponding card from the player's hand"
    end

    describe "#fold" do
        it "empties the player's hand"
        it "instructs the dealer to discard the cards"
    end

    describe "#see" do
        it "sets the player's pot equal to the game's bet"
        it "reduces the player's total funds"
    end

    describe "#raise" do
        it "sets the player's pot to the given amt"
        it "instructs the game to raise the bet"
        it "reduces the player's total funds"
    end
end