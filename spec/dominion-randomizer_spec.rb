require 'randomizer'
describe "Card" do
  it "has specific attributes" do
    card = make_card("Gold", 6, "Base")
    card[:name].should == "Gold"
    card[:set].should == "Base"
  end
end

describe "Randomizer" do
  before :each do
    @randomizer = Randomizer.new(random_cards)
  end

  def random_cards
    cards = []
    11.times do
      cards << make_card("something", 2, "base")
    end
    cards
  end

  it "can be constructed" do
    @randomizer.should_not == nil
  end

  it "has some cards in it" do
    cards = @randomizer.get_random_cards
    cards.should be_an(Array)
    cards.size.should > 0
  end

  it "should not return the same list each time" do
    first_cards = @randomizer.get_random_cards
    second_cards = @randomizer.get_random_cards
    first_cards.object_id.should_not == second_cards.object_id
  end

  it "should only contain the objects from random_cards" do
    cards = random_cards
    random_set = @randomizer.get_random_cards
    random_set.each {|i| cards.should include(i) }
  end

  it "should contain exactly 10 cards" do
    cards = @randomizer.get_random_cards
    cards.size.should == 10
  end
end
