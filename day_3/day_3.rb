
input = File.readlines('input.txt').map{|x| x.rstrip.chars }

count = 0
x = 0

input.each { |line|
    x = x - line.length if x >= line.length
    count = count + 1 if line[x] == "#"    
    x = x + 3
}

puts count