class City
  puts 'City class loaded!'

  def initialize(attrs, &block)
    attrs.each do |key, value|
      self.instance_variable_set("@#{key.snakecase}", value)
      self.class.send(:attr_accessor, key.snakecase)
    end
    @neighborhoods = block.call(neighborhoods)
  end

  def to_h 
    self.instance_variables.map do |name| 
      value = instance_variable_get(name)
      next nbrhd(value) if value.is_a?(Array)
      value
    end
  end

  def nbrhd(value)
    value.map { |value| value.to_h } 
  end
end