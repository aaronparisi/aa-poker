require 'rspec'
require 'hand_parser'
require 'deck'

describe HandParser do
    let(:hp) {HandParser.new}
    describe "#royal_flush?" do

        let(:aDeck) {Deck.new}
        let(:rf) {
            [
                aDeck["Ace Spades"], 
                aDeck["King Spades"], 
                aDeck["Queen Spades"], 
                aDeck["Jack Spades"], 
                aDeck["10 Spades"]
            ]
        }

        context "when hand is a royal flush" do
            it "returns true" do
                expect(rf.royal_flush?).to be true
            end
        end

        context "when hand is not a royal flush" do
            it "returns false" do
            end
        end
    end
end