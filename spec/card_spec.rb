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
end