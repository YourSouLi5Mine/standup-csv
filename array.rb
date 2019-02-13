class Array
  require 'snake_camel'
  
  puts 'Array class loaded!'

  def sort_arr(col)
    self.sort! { |a, b| a.send(col) <=> b.send(col) }
  end

  def self.meta_methods(methods)
    methods[0..-2].each { |attr| select_by(attr.snakecase) }
  end

  def self.select_by(attr)
    puts "select_#{attr} method created"
    define_method("select_#{attr}") { |value| self.select(&find_block(attr, value)) }
  end

  def find_block(attr, value)
    -> (row) { row.send(attr) == value }
  end
end
