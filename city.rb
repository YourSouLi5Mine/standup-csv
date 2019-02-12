class City
  require 'snake_camel'

  puts 'City class loaded!'

  def initialize(attrs, &block)
    attrs.each do |key, value|
      self.instance_variable_set("@#{key.snakecase}", value)
      self.class.send(:attr_accessor, key.snakecase)
    end
    @neighborhoods = block.call(neighborhoods)
  end
end
