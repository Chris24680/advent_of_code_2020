inputs = File.readlines('input.txt')

puts inputs.map{|i| i.split }.count{ |i|
    bounds = i[0].split("-").map(&:to_i)
    (bounds[0]..bounds[1]).include?(i[2].count(i[1][0]))
}