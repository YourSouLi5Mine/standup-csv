require_relative './reader'
require_relative './array.rb'
require 'pry'

reader = Reader.new

puts 'Your csv looks like:'
arr = reader.read
arr.pretty

puts 'With structs'
arr_struct = arr.to_struct 
arr_struct.pretty

puts 'Sorted looks like:' 
sorted = arr.sort_arr
sorted.pretty

puts 'Sorted with structs looks like:'
sorted_struct = arr_struct.sort_arr
sorted_struct.pretty

puts 'Write how much rows you want to show from the sorted arrays'
qty = gets.chomp.to_i
puts "First #{qty} in normal array"
sorted.first(qty+1).pretty
puts "First #{qty} in struct array"
sorted_struct.first(qty+1).pretty

puts 'Write which column do you wanna change'
col = gets.chomp.to_i
puts 'Write the initial value'
value = gets.chomp
puts "Normal arrray: col -> #{col}, initial_value -> #{value}"
sorted.change_col(col, value).pretty
puts "Struct arrray: col -> #{col}, initial_value -> #{value}"
sorted_struct.change_col(col, value).pretty
binding.pry
