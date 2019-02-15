require          'active_support'
require          'pry'
require_relative './helpers/array'

autoload :IndexHelper,   './helpers/index_helper'
autoload :Reader,       './helpers/reader'
autoload :Writer,       './helpers/writer'
autoload :City,         './models/city'
autoload :Neighborhood, './models/neighborhood'

include IndexHelper

csv                = IndexHelper::csv('./csv/cities2.csv')
csv.header         = IndexHelper::nil!(csv.header)
cities             = IndexHelper::cities(csv)
uniq_neighborhoods = IndexHelper::uniq(cities)

IndexHelper::metaprogramming(csv.header[0..-2])
IndexHelper::methods
