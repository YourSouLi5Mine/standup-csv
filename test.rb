require 'active_support'
require 'pry'
require_relative './array'

autoload :Reader, './reader'
autoload :City, './city'
autoload :Neighborhood, './neighborhood'

csv = Reader.new('./cities2.csv')

cities = csv.to_struct

puts 'csv'
puts 'cities'
puts 'cities.sort_arr(col_to_sort)'
puts 'cities.first(n)'
puts 'cities[index].attr = new_value'

binding.pry
