class Writer
  require 'csv'
  require 'snake_camel'

  puts 'Writer class loaded!'

  def initialize(header, rows)
    @header = header
    @rows = rows
  end

  def to_csv(arr, file = nil)
    CSV.open(file, "w+") { |csv| arr.each { |row| csv << row } }
  end

  def to_a
    arr = @rows.map { |row| row.to_h }
    arr.unshift(@header)
  end
end

