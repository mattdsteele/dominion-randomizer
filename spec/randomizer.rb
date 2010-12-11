class Randomizer

  def initialize(cards)
    @cards = cards
  end

  def get_random_cards
    @cards.sort_by {rand}[1..10]
  end
end

def make_card(name, cost, set)
  {:name => name, :cost => cost, :set => set}
end

class SetRule
  def initialize(*set)
    @sets = set
  end

  def passes(card)
    @sets.include? card[:set] 
  end
end
