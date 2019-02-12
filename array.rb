class Array
  puts 'Array class loaded!'

  def sort_arr(col)
    self.sort! { |a, b| a.send(col) <=> b.send(col) }
  end
end
