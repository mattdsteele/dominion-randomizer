class Randomizer
  def random_cards
    cards = []
    10.times do
      cards << {}
    end
    cards
  end

  def get_random_cards
    random_cards.sort_by {rand}
  end
end

def make_card(name, cost, set)
  {:name => name, :cost => cost, :set => set}
end
