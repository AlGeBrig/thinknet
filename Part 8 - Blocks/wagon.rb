require_relative 'manufacturer'
require_relative 'validation'

class Wagon
  include Manufacturer
  include Validation
  attr_reader :type, :number

  def initialize(number)
    @number = number
    validate!
  end

  protected

  def validate!
    raise 'Ошибка! Правильный формат номера вагона: две любые цифры!' if @number !~ /^[0-9]{2}$/
  end

end
