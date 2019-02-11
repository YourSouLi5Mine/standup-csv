require 'csv'

class Reader
  def initialize
    @path = File.expand_path File.dirname(__FILE__)
  end

  def read
    arr = CSV.read("#{@path}/cities.csv")
  end
end

