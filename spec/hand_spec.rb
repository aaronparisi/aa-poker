require 'rspec'

require 'hand'
require 'card'

describe Hand do
    subject { described_class.new }
    #let(:card) { Card.new(10, 'spades') }
    let(:aCard) {double("card")}

    describe '#initialize' do
        it 'initializes an empty hand' do
            expect(subject.cards).to be_empty        
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
    
    describe '#include' do
        it 'returns true if the deck includes the card' do
            subject.add(aCard)
            expect(subject).to include(aCard)
        end

        it 'returns false if the deck doesn\'t include the card' do
            expect(subject).to_not include(aCard)
        end
    end
end