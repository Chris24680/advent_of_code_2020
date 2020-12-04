# user     system      total        real
# 0.004585   0.000017   0.004602 (  0.004684)
# 0.000000   0.002055   0.002055 (  0.002056)
# 0.000000   0.000066   0.000066 (  0.000066)

require 'benchmark'

def find_match(input)
  input.combination(2).find { |expense| expense.sum === 2020 }.reduce(:*)
end

def find_match_quick(input)
  x = input.shift
  y = input.find{ |z| x + z == 2020 }
  y ? x * y : find_match_quick(input)
end 

def find_match_quicker(inputs)
  hash = {}
  inputs.each { |input| 
    result = hash[input]
    return result*input if result 
    hash[2020-input] = input
  }
end 

input = File.readlines('input.txt', chomp:true).map(&:to_i)

Benchmark.bm do |x|
  input = File.readlines('input.txt', chomp:true).map(&:to_i)
  x.report { find_match(input) }
  input = File.readlines('input.txt', chomp:true).map(&:to_i)
  x.report { find_match_quick(input) }
  input = File.readlines('input.txt', chomp:true).map(&:to_i)
  x.report { find_match_quicker(input) }
end