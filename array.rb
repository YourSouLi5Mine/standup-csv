class Array
  def pretty
    self.each do |row|
      print row
      puts
    end
  end

  def to_struct
    arr_struct = [self[0]]
    city = Struct.new(*self[0].map {|value| value.to_sym})
    self[1..-1].each { |row| arr_struct << city.new(*row) }
    arr_struct
  end

  def sort_arr
    self[1..-1] = self[1..-1].sort! { |a, b| a[8] <=> b[8] }
    self
  end

  def change_col(index, value)
    self[1..-1].each do |row| 
      row[index] = value
      value = value.succ
    end
    self
  end
end
