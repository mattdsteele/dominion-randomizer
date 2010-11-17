class Randomizer
  def get_random_cards
    []
  end
end

class Card
end

describe "Card" do
  it "can be constructed" do
    card = Card.new
    card.should_not.nil?
  end
end

describe "Randomizer" do
  it "can be constructed" do
    randomizer = Randomizer.new
    randomizer.should_not == nil
  end

  it "has some cards in it" do
    randomizer = Randomizer.new
    cards = randomizer.get_random_cards
    cards.should == []
  end
end
