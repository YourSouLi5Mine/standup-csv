module IndexHelper
  def csv(file = nil)
    begin
      csv = Reader.new(file)
    rescue Exception
      puts "The file #{file} doesn't exist or has another extension"
      puts 'Write the correct file path'
      file = gets.chomp
      retry
    end
  end

  def nil!(row)
    row.each_with_index.map do |value, index|
      begin
        raise if value.nil?
        value
      rescue
        puts "\nnil on row[#{index}] was found... 🤬"
        puts 'Write a valid one'
        value = gets.chomp
      end
    end
  end

  def cities(csv)
    csv.to_struct
  end

  def metaprogramming(header)
    puts "\nMETAPROGRAMMING for the Array class 👌"
    Array.meta_methods(header)
  end

  def uniq(cities)
    neighborhood = -> (cities) { cities.map { |city| city.neighborhoods } }
    uniq_neighborhood = -> (neighborhood) do 
      neighborhood.flatten.uniq { |uniq_neighborhood| uniq_neighborhood.name }
    end
    uniq_neighborhood.call(neighborhood.call(cities))
  end

  def methods
    puts "\nMETHODS"
    puts 'PRINTS the csv file: csv'
    puts 'PRINTS the csv as classes: cities'
    puts 'SORTS cities: cities.sort_arr(col_name)'
    puts 'TAKE first n values from cities: cities.first_rows(n)'
    puts 'FINDS city (replace select_attr with metaprogramming methods:'
    puts 'cities.select_attr(value) '
    puts 'GETS all unique neighborhoods: uniq_neigh'
    puts 'FOLLOW the 3 steps below to write a csv file with cities changes'
    puts 'writer = Writer.new(csv.header, cities)'
    puts 'cities_arr = writer.to_a'
    puts 'writer.to_csv(cities_arr, filename_path)'
  end
end
