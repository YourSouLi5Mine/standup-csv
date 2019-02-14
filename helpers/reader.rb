class Reader
  require 'csv'

  puts 'Reader class loaded!'

  attr_accessor :header, :rows

  def initialize(file = nil)
    @file = file
    @header, *@rows = CSV.read(@file).to_a
  end

  def to_struct
    rows.map { |row| City.new(Hash[header.zip(row)], &block) }
  end

  def block 
    -> (row) { JSON.parse(row).map { |attrs| Neighborhood.new(attrs) } }
  end
end

