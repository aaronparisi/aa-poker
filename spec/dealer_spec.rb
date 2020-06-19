require 'rspec'
require 'dealer'

describe Dealer do

    let(:aDeck) {double("aDeck")}
    let(:aGame) {double("aGame")}

    subject(:aDealer) {Dealer.new(aDeck, aGame)}

    let(:aPlayer) {double("aPlayer")}
    let(:aCard) {double("aCard")}

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
    # so the issue is this: i have two doubles
    # aPlayer (who needs to receive a call to receive_cards), and
    # aDeck   (who needs to receive a call to deal_n)
    # the problem is, each call to Dealer#deal will make both of those calls
    # I need both doubles to be able to receive those calls
    # even if I'm not testing that expectation in the example

        before(:all) do
            allow(aPlayer).to receive(:receive_cards)
            allow(aDeck).to receive(:deal_n)
        end
        it "calls the given player's #receive_cards method" do
            expect(aPlayer).to receive(:receive_cards)

            aDealer.deal(aPlayer, 5)
        end

        it "calls the deck's deal_n method" do
            expect(aDeck).to receive(:deal_n).with(5)

            aDealer.deal(aPlayer, 5)
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