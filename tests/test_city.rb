require          'minitest/autorun'
require          'json'
require_relative '../models/city'

class TestCity < MiniTest::Test
  def setup
    @city_with_symbols = City.new({
      city: 'Guadalajara',
      state: 'Jalisco',
      neighborhoods: [{
        "name" => "Eugenia",
        "habitans" => "8291"
      }, {
        "name" => "Lomas Del Gallo",
        "habitans" => "12391"
      }]
    }, &block)

    @city_with_string = City.new({
      'city': 'Guadalajara',
      'state': 'Jalisco',
      'neighborhoods': '[{ "name":"Eugenia","habitans":"8291" }, { "name":"Lomas Del Gallo","habitans":"12391" }]'
    }, &block)
  end

  def test_that_city_with_symbols_is_created_correctly
    assert_instance_of(City, @city_with_symbols)
  end

  def test_that_city_with_string_is_created_correctly
    assert_instance_of(City, @city_with_string)
  end

  def block
    -> (row) do
      row = JSON.parse(row) unless row.is_a?(Array)
      row.map { |attrs| Neighborhood.new(attrs) }
    end
  end
end
