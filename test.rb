require          'active_support'
require          'pry'
require_relative './helpers/array'
require_relative './helpers/test_helper'

autoload :Reader,       './helpers/reader'
autoload :Writer,       './helpers/writer'
autoload :City,         './models/city'
autoload :Neighborhood, './models/neighborhood'

include TestHelper

csv        = TestHelper::csv('./csv/cities2.csv')
cities     = TestHelper::cities(csv)
uniq_neigh = TestHelper::uniq(cities)

TestHelper::metaprogramming(csv.header[0..-2])
TestHelper::methods

