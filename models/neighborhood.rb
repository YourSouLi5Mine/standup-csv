class Neighborhood
  puts 'Neighborhood class loaded'

  def initialize(attrs)
    attrs.each do |key, value|
      self.instance_variable_set("@#{key.snakecase}", value)
      self.class.send(:attr_accessor, key.snakecase)
    end
  end

  def to_h 
    hash = {}
    self.instance_variables.map { |name| hash[name.to_s[1..-1]] = instance_variable_get(name) }
    hash
  end
end
