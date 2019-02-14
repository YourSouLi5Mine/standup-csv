module TestHelper
  def csv(file = nil)
    csv = Reader.new(file)
  end

  def cities(csv)
    csv.to_struct
  end

  def metaprogramming(header)
    puts "\nMETAPROGRAMMING for the Array class 👌"
    Array.meta_methods(header)
  end

  def uniq(cities)
    nbrhd = -> (cities) { cities.map { |city| city.neighborhoods } }
    uniq_nbrhd = -> (nbrhd) { nbrhd.flatten.uniq { |uniq_nbrhd| uniq_nbrhd.name } }
    uniq_nbrhd.call(nbrhd.call(cities))
  end

  def methods
    puts "\nMETHODS"
    puts 'PRINTS the csv file: csv'
    puts 'PRINTS the csv as classes: cities'
    puts 'SORTS cities: cities.sort_arr(col_name)'
    puts 'TAKE first n values from cities: cities.first(n)'
    puts 'FINDS city (replace select_attr with metaprogramming methods:'
    puts 'cities.select_attr(value) '
    puts 'GETS all unique neighborhoods: uniq_neigh'
    puts 'FOLLOW the 3 steps below to write a csv file with cities changes'
    puts 'writer = Writer.new(csv.header, cities)'
    puts 'arr = writer.to_a'
    puts 'writer.to_csv(arr, filename)'
  end
end
