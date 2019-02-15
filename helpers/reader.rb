class Reader
  require          'csv'
  require          'json'
  require_relative '../models/city'

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
    -> (row) do
      row = JSON.parse(row) unless row.is_a?(Array)
      row.map { |attrs| Neighborhood.new(attrs) }
    end
  end
end

