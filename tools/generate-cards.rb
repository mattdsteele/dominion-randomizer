require 'json'
file = IO.read('dominion-cardlist.txt')
cards = file.split(/^$/).collect do |card|
  lines = card.split(/\n/)
  lines.slice!(0)
  c = {}
  split_arr = lines.map do |line|
    type,element = line.split(': ')
    if type == "Type"
      c[type.downcase.strip] = element.split('-').map {|x| x.strip}
    else
      c[type.downcase.strip] = element.strip unless element == nil
    end
  end
  c
end

as_json = cards.to_json

File.open('cards.json', 'w').puts(as_json)
