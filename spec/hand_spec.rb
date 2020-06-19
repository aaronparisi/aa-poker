require 'rspec'

require 'hand'
require 'card'

describe Hand do
    subject { described_class.new }
    let(:card) { Card.new(10, 'spades') }

    describe '#initialize' do
        it 'initializes an empty hand' do
            expect(subject.cards).to be_empty        
        end
    end
    
    describe '#add' do
        it 'adds a card to the hand' do
             subject.add(card)
             expect(subject.cards).to include(card)
             
             # OR 
             # expect { subject.add(card) }.to change { subject.cards.length }.from(0).to(1)
        end
    end
    
    describe '#remove' do
        before(:each) do { subject.add(card) }
        it 'removes a card from the hand' do
            subject.remove(card)
            expect(subject.cards).to be_empty

            # OR 
            # 
            # expect { subject.remove(card) }.to change { subject.cards.length }.from(1).to(0)
        end
    end
    
    describe '#include' do
        it 'returns true if the deck includes the card' do
            subject.add(card)
            expect(subject).to inlcude(card)
        end

        it 'returns false if the deck doesn\'t include the card' do
            expect(subject).to.not inlcude(card)
        end
    end
end