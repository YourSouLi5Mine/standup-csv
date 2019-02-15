require          'minitest/autorun'
require_relative '../helpers/reader'

class TestReader < MiniTest::Test
  def setup
    @reader = {
      128 => Reader.new('./csv/cities.csv'),
      49 => Reader.new('./csv/cities2.csv')
    }
  end

  def test_that_rows_length_equals_file_entries_quantity
    @reader.each do |length, reader|
      assert_equal(length, reader.rows.length)
    end
  end

  def test_that_to_struct_creates_an_array_with_city_instances
    @reader.values.each do |reader|
      assert(reader.to_struct.all? { |city| city.instance_of? City })
    end
  end

  def test_that_to_struct_creates_instances_of_neighborhood_inside_city_instances
    @reader.values.each do |reader|
      reader.to_struct.each do |city|
        assert(city.neighborhoods.all? do |neighborhoods|
          neighborhoods.instance_of? Neighborhood
        end)
      end
    end
  end
end
