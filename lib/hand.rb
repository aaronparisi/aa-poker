require 'card'

class Hand

    attr_reader :cards

    # Yep. expect(hand.cards).to be_empty
    def initialize
        @cards = []
    end 
    
    # Easy
    def include?(c)
        cards.include?(c)
    end

    # Easy
    def add(c)
        @cards << c
    end

    # Easy
    def remove(c)
        @cards.delete(c)
    end

    def size
        cards.length
    end

    def empty
        ret = cards
        @cards = []
        ret
    end

    # royal flush       234 + 1
    # straight flush    221 + high_card
    # four of a kind    208 + quad_val
    # full house        195 + trip_val
    # flush             182 + high_card
    # straight          169 + high_card
    # three of a kind   130 + (trip_val * 2) + high_card
    # two pair          52 + (high_pair * 3) + (low_pair * 2) + high_card
    # pair              13 + (pair_value * 2) + high_card
    # high card         high_card

    def disect
        sorted = cards.sort_by {|c| c.point_val}
        groups = get_groupings(sorted)

        high_card_val = sorted[-1].point_val

        if groups.length == 5
            # there are no pairs at all
            is_flush = flush?
            if straight?
                if is_flush
                    # straight flush or royal flush
                    high_card_val == 1 ? return 235 : return (221 + high_card_val)
                else
                    # regular straight
                    return 169 + high_card_val
                end
            elsif is_flush
                # flush, not straight
                return 182 + high_card_val
            else
                # not a straight or a flush, still no pairs
                return high_card_val
            end
        else
            # we have some pairage
            singles = []
            pairs = []
            trips = []
            quads = []
            groups.each do |g|
                val = g.first.first.value
                singles << val if g.length == 1
                pairs << val if g.length == 2
                trips << val if g.length == 3
                quads << val if g.length == 4
            end
            if ! quads.empty?
                # four of a kind
                return 208 + quads.first
            elsif ! trips.empty?
                if ! pairs.empty?
                    # we have a trip and a pair => full house
                    return 195 + trips.first
                else
                    # we have 3 of a kind, no pairs
                    return 130 + (trips.first * 2) + high_card_val
                end
            else
                if pairs.length == 1
                    # one pair
                    return 13 + pairs.first + high_card_val
                else
                    # 2 pairs
                    return 52 + (pairs.last * 3) + (pairs.first * 2) + high_card_val
                end
            end
        end


    end

    def royal_flush?
        # A K Q J 10, all same suit
        return false if ! flush?
        suit = @cards[0].suit
        matcher = [
            "Ace #{suit}", 
            "King #{suit}", 
            "Queen #{suit}", 
            "Jack #{suit}", 
            "10 #{suit}"
        ]
        matcher.all? {|m| self.include_by_string?(m)}
    end

    def straight_flush?
        # 5 in a row, same suit
        return false if ! flush?

        straight?
    end

    def four_of_a_kind?
        # hand has 4 cards w same value
        sorted = cards.sort_by {|c| c.point_val}
        sorted[0..3].all? {|c| c.value == sorted[0].value} ||
        sorted[1..4].all? {|c| c.value == sorted[1].value}
    end

    def full_house?
        # 3 of a kind + a pair
        three_of_a_kind? && pair?
    end

    def flush?
        # 5 cards of same suit, but not in sequence
        match = cards[0].suit
        cards.filter {|c| c.suit == match}.length == 5
    end

    def straight?
        # 5 cards in sequence, not same suit
        sequence?(cards.sort_by {|c| c.point_val})
    end

    def three_of_a_kind?
        # 3 cards, same value
        sorted = cards.sort_by {|c| c.point_val}
        sorted[0..2].all? {|c| c.value == sorted[0].value} ||
        sorted[2..4].all? {|c| c.value == sorted[0].value}
    end

    def two_pair?
        # 2 different pairs
        cards.uniq.length == 3
    end

    def pair?
        # 2 cards, same value
        cards.uniq.length == 4
    end

    private

    def include_by_string?(str)
        cards.any? {|c| c.by_string(str)}
    end

    def sequence?(points)
        return true if points.length == 1
        ((points[0] + 1) % 13) == points[1] && sequence(points[1..-1])
    end

    def get_groupings(cards)
        ret = []
        cur_group = []
        cards.each do |c|
            if cur_group.length == 0 || cur_group.first == c
                cur_group << c
            else
                ret << cur_group
                cur_group = []
            end
        end
    
        ret
    end

end