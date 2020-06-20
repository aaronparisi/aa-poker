require 'rspec'

require 'card'

describe "Card" do
    subject(:aCard) {Card.new("5", "Clubs")}
    describe "#initialize" do
        it "sets the value" do
            expect(aCard.value).to eq("5")
        end
        it "sets the suit" do
            expect(aCard.suit).to eq("Clubs")
        end
    end

    describe "#==" do
        context "when the given value and suit match the card's" do
            it "returns true" do
                expect(aCard == ["5", "Clubs"]).to be true
            end
        end
    end
end