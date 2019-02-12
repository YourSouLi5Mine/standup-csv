class Neighborhood
  require 'snake_camel'

  puts 'Neighborhood class loaded'

  def initialize(attrs)
    attrs.each do |key, value|
      self.instance_variable_set("@#{key.snakecase}", value)
      self.class.send(:attr_accessor, key.snakecase)
    end
  end
end
