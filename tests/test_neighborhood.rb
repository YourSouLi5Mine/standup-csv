require          'minitest/autorun'
require_relative '../models/neighborhood'

class TestNeighborhood < MiniTest::Test
  def setup
    @neighborhood_with_symbols = Neighborhood.new({
      name: 'Santa Barbara',
      habitans: 145
    })

    @neighborhood_with_strings = Neighborhood.new({
      "name" => 'El Trapiche',
      "habitans" => 3
    })
  end

  def test_that_neighborhood_with_symbols_is_created_correctly
    assert_instance_of(Neighborhood, @neighborhood_with_symbols)
  end

  def test_that_neighborhood_with_strings_is_created_correctly
    assert_instance_of(Neighborhood, @neighborhood_with_strings)
  end
end
