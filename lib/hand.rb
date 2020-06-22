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

    def no_pairs(high_card_val)
        # there are no pairs at all
        is_flush = flush?
        if straight?
            if is_flush
                # straight flush or royal flush
                if high_card_val == 1
                    return 235
                else
                    return 221 + high_card_val
                end
            else
                # regular straight
                return 169 + high_card_val
            end
        elsif is_flush
            # flush, not straight
            return 182 + high_card_val
        else
            # nothing burger
            return high_card_val
        end
    end

    def yes_pairs(groups, high_card_val)
        if ! groups[4].empty?
            # four of a kind
            return 208 + quads.first
        elsif ! groups[3].empty?
            if ! pairs.empty?
                # we have a trip and a pair => full house
                return 195 + trips.first
            else
                # we have 3 of a kind, no pairs
                return 130 + (trips.first * 2) + high_card_val
            end
        else
            if groups[2].length == 1
                # one pair
                return 13 + pairs.first + high_card_val
            else
                # 2 pairs
                return 52 + (pairs.last * 3) + (pairs.first * 2) + high_card_val
            end
        end
    end

    def disect
        sorted = cards.sort_by {|c| c.point_val}
        groups = get_groupings(sorted)

        high_card_val = sorted[-1].point_val

        if groups[1].length == 5
            no_pairs(high_card_val)
        else
            # we have some pairage
            yes_pairs(groups, high_card_val)
        end


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

    private

    def include_by_string?(str)
        cards.any? {|c| c.by_string(str)}
    end

    def sequence?(points)
        return true if points.length == 1
        ((points[0] + 1) % 13) == points[1] && sequence(points[1..-1])
    end

    def get_groupings(cards)
        ret = {1 => [], 2 => [], 3 => [], 4 => []}
        cur_group = []
        cards.each do |c|
            if cur_group.length == 0 || cur_group.first == c
                cur_group << c
            else
                ret[cur_group.length] << cur_group
                cur_group = []
            end
        end
    
        ret
    end

end