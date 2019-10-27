require_relative 'manufacturer'
require_relative 'validation'
# Wagon General
class Wagon
  include Manufacturer
  include Validation
  attr_reader :type, :number

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @occupied_capacity = 0
    validate!
  end

  attr_reader :occupied_capacity

  def free_capacity
    @capacity - @occupied_capacity
  end

  def add_content(content)
    return if (content + @occupied_capacity) < @capacity
    @occupied_capacity += content
  end

  protected

  def validate!
    raise 'Правильный формат: две любые цифры!' if @number !~ /^[0-9]{2}$/
  end
end
