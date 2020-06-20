require 'rspec'

require 'hand'
require 'card'

require 'deck'

describe Hand do
    subject { described_class.new }
    #let(:card) { Card.new(10, 'spades') }
    let(:aCard) {double("card")}

    let(:aDeck) {Deck.new}
    let(:rf) {Hand.new}

    let(:ace_spades) {aDeck["Ace Spades"]}
    let(:king_spades) {aDeck["King Spades"]}
    let(:queen_spades) {aDeck["Queen Spades"]}
    let(:jack_spades) {aDeck["Jack Spades"]}
    let(:ten_spades) {aDeck["10 Spades"]}

    describe '#initialize' do
        it 'initializes an empty hand' do
            expect(subject.cards).to be_empty        
        end
    end

    describe '#include?' do
        it 'returns true if the deck includes the card' do
            subject.add(aCard)
            expect(subject).to include(aCard)
        end

        it 'returns false if the deck doesn\'t include the card' do
            expect(subject).to_not include(aCard)
        end
    end
    
    describe '#add' do
        it 'adds a card to the hand' do
             subject.add(aCard)
             expect(subject.cards).to include(aCard)
             
             # OR 
             # expect { subject.add(card) }.to change { subject.cards.length }.from(0).to(1)
        end
    end
    
    describe '#remove' do
        before(:each) { subject.add(aCard) }
        it 'removes a card from the hand' do
            subject.remove(aCard)
            expect(subject.cards).to be_empty

            # OR 
            # 
            # expect { subject.remove(card) }.to change { subject.cards.length }.from(1).to(0)
        end
    end

    describe '#size' do
        it "returns the size of the hand" do
            subject.add(aCard)
            subject.add(aCard)
            expect(subject.size).to eq(2)
        end
    end

    describe '#empty' do
        it "empties the hand" do
            subject.add(aCard)
            subject.add(aCard)
            expect {subject.empty}.to change {subject.size}.from(2).to(0)
        end
        it "returns an array" do
            expect(subject.empty).to be_an(Array)
        end
    end

    describe '#royal_flush' do
        it "returns true if the hand is a royal flush" do
            rf.add(ace_spades)
            rf.add(king_spades)
            rf.add(queen_spades)
            rf.add(jack_spades)
            rf.add(ten_spades)
            expect(rf.royal_flush?).to be true
        end
        it "returns false otherwise" do
        end
    end
end