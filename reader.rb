class Reader
  require 'csv'

  puts 'Reader class loaded!'

  attr_reader :header, :rows

  def initialize(file = nil)
    @file = file
    @header, *@rows = CSV.read(@file).to_a
  end

  def to_struct
    block = -> (row) do 
      neighborhoods = []
      row = JSON.parse(row)
      row.each do |attrs|
        neighborhoods << Neighborhood.new(attrs)
      end
      neighborhoods
    end

    cities = []
    rows.each do |row| 
      cities << City.new(Hash[header.zip(row)], &block)
    end
    cities
  end
end

