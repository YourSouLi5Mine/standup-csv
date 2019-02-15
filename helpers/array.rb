class Array
  require 'snake_camel'
  
  puts 'Array class loaded!'

  def sort_arr(col)
    self.sort! do |a, b|
      begin
        a.send(col) <=> b.send(col)
      rescue TypeError, ArgumentError, NoMethodError
        puts "The column name doesn't exist!"
        puts 'Write it again'
        col = gets.chomp
        retry
      end
    end
  end

  def first_rows(input)
    begin
      raise TypeError unless /^\d+$/ =~ input.to_s
      self.first(input.to_i)
    rescue TypeError
      puts 'Wrong type'
      puts 'Write an integer instead'
      input  = gets.chomp
      retry
    end
  end

  def self.meta_methods(methods)
    methods.each { |attr| select_by(attr.snakecase) }
  end

  def self.select_by(attr)
    puts "select_#{attr} method created"
    define_method("select_#{attr}") { |value| self.select(&find_block(attr, value)) }
  end

  def find_block(attr, value)
    -> (row) { row.send(attr) == value }
  end
end
