require_relative 'wagon'
class CargoWagon < Wagon
  def initialize(number, capacity)
    super(number)
    @type = :cargo
    @capacity = capacity
    @charged_content = 0
  end

  def add_content(content)
    if (content + @charged_content) < @capacity
      @charged_content += content
    else 
      raise "No more content"
    end
  end

  def charged_content
    @charged_content
  end

  def free_capacity
    @capacity - @charged_content
  end

end
