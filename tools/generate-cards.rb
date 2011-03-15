def convert_money(cost)
  cost.split('+').map do |x|
    if (x =~ /\d*P$/)
      ["potion", x.sub(/P/,'')]
    else
      ["coin",x]
    end
  end
end

require 'json'
file = IO.read('dominion-cardlist.txt')
cards = file.split(/^$/).collect do |card|
  lines = card.split(/\n/)
  lines.slice!(0)
  c = {}
  split_arr = lines.map do |line|
    type,element = line.split(': ')
    type = type.downcase.strip
    if type == "type"
      c[type] = element.split('-').map {|x| x.strip}
    elsif type == "cost" then
      c[type] = convert_money(element)
    else
      c[type] = element.strip unless element == nil
    end
  end
  c
end

as_json = cards.to_json

File.open('cards.json', 'w').puts(as_json)
