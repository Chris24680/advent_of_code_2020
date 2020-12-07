inputs = File.readlines('input.txt')

# part 1
puts inputs.map{|i| i.split }.count{ |i|
    bounds = i[0].split("-").map(&:to_i)
    (bounds[0]..bounds[1]).include?(i[2].count(i[1][0]))
}

# part 2
puts inputs.map{|i| i.split }.count{ |i|
    places = i[0].split("-").map(&:to_i)
    (i[2][places[0]-1] == i[1][0]) ^ (i[2][places[1]-1] == i[1][0])
}