require 'rspec'
require 'dealer'

describe Dealer do

    describe "#play_round" do
        it "deals each player 5 cards"
        it "asks each player for initial actions"
        it "asks each player for any discards"
        it "replaces each player's discards"
        it "asks each player for second actions"
        it "determines the winner"
        it "rotates the first_deal_pos"
    end

    describe "#deal" do
        it "calls the given player's #receive_cards method" do
        end

        it "calls the deck's deal_n method" do
        end
    end

    describe "#request_actions" do
    end

    describe "#request_discards" do
    end

    describe "#discard_cards" do
        it "adds the given cards to the discard pile"
    end

    describe "#award_winner" do
        it "calls the winning player's '#take_pot' method"
    end
end