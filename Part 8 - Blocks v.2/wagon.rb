require_relative 'manufacturer'
require_relative 'validation'

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

  def occupied_capacity
    @occupied_capacity
  end

  def free_capacity
    @capacity - @occupied_capacity
  end
  
  def add_content(content)
    if (content + @occupied_capacity) < @capacity
      @occupied_capacity += content
    else 
      raise "No more content"
    end
  end
  
  protected

  def validate!
    raise 'Ошибка! Правильный формат номера вагона: две любые цифры!' if @number !~ /^[0-9]{2}$/
  end

end
