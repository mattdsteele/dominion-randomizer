class Randomizer
  def random_cards
    [{},
    {}]
  end

  def get_random_cards
    random_cards.sort_by {rand}
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
    cards.should be_an(Array)
    cards.size.should > 0
  end

  it "should not return the same list each time" do
    randomizer = Randomizer.new
    first_cards = randomizer.get_random_cards
    second_cards = randomizer.get_random_cards
    first_cards.object_id.should_not === second_cards.object_id
  end

  it "should only contain the objects from random_cards" do
    randomizer = Randomizer.new
    cards = randomizer.random_cards
    random_set = randomizer.get_random_cards
    random_set.each {|i| cards.should include(i) }
  end
end
