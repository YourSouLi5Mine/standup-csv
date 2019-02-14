require          'active_support'
require          'pry'
require_relative './helpers/array'
require_relative './helpers/test_helper'

autoload :Reader,       './helpers/reader'
autoload :Writer,       './helpers/writer'
autoload :City,         './models/city'
autoload :Neighborhood, './models/neighborhood'

csv = Reader.new('./cities2.csv')

cities = csv.to_struct

puts "\nMetaprogramming for the Array class 👌"
Array.meta_methods(csv.header)

neighborhoods = -> (cities) { cities.map { |row| row.neighborhoods } }
unique = -> (neighborhoods) { neighborhoods.flatten.uniq { |obj| obj.name } }
uniq_n = unique.call(neighborhoods.call(cities))

puts "\nMethods"
puts 'csv'
puts 'cities'
puts 'cities.sort_arr(col_name)'
puts 'cities.first(n)'
puts 'cities.select_attr(value) '
puts 'uniq_n'
# puts 'writer = Writer.new(csv.header, cities)'

binding.pry

