require 'randomizer'

describe "Card" do
  it "has specific attributes" do
    card = make_card("Gold", 6, "Base")
    card[:name].should == "Gold"
    card[:set].should == "Base"
  end
end

def random_cards
  cards = []
  15.times do |i|
    cards << make_card("something #{i}", 2, "base")
  end
  cards
end

describe "Randomizer" do
  before :each do
    @randomizer = Randomizer.new(random_cards)
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

describe "SetRule" do
  it "only allows one type of card in" do
    cards = [make_card("included", 5, "good"), make_card("excluded", 5, "bad")]
    rule = SetRule.new("good")
    passing_cards = cards.select {|card| rule.passes(card)}
    passing_cards.size.should == 1
    passing_cards[0][:set].should == "good"
  end

  it "allows multiple sets" do
    cards = [
      make_card("included", 5, "good"), 
      make_card("excluded", 5, "bad"), 
      make_card("included", 5, "another_good")
    ]
    rule = SetRule.new("good", "another_good")
    passing_cards = cards.select {|card| rule.passes(card)}
    passing_cards.size.should == 2
    passing_cards.each {|card| card[:name].should == "included" }
  end
end

describe "JsonConverter" do
  it "can serialize an empty cardset" do
    card = []
    JSON.generate({:cards => card}).should == "{\"cards\":[]}"
  end

  it "can serialize a single card" do
    card = make_card("Gold", 6, "base")
    convert_json([ card ]).should == '{"cards":[{"name":"Gold","cost":6,"set":"base"}]}'
  end

  it "can serialize multiple cards" do
    cards = [ make_card("Silver", 3, "base"), make_card("Copper", 0, "base")]
    convert_json(cards).should == '{"cards":[{"name":"Silver","cost":3,"set":"base"},{"name":"Copper","cost":0,"set":"base"}]}'
  end
end
