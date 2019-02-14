class Writer
  require 'csv'

  puts 'Writer class loaded!'

  def initialize(header, rows)
    @header = header
    @rows = rows
  end

  def to_csv(arr, file = nil)
    begin
      CSV.open(file, "w+") { |csv| arr.each { |row| csv << row } }
    rescue TypeError, Errno::EISDIR, Errno::ENOENT
      puts "Wrong type or it's a folder!"
      puts 'Write a relative path like this ./csv/filename'
      file = gets.chomp
      retry
    end
  end

  def to_a
    arr = @rows.map { |row| row.to_h }
    arr.unshift(@header)
  end
end

