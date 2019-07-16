require_relative 'train'

class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super
    @type = :cargo
  end

  protected

  def connect_wagon(wagon)
    if @current_speed == 0 && wagon.type == :cargo
      @wagons << wagon unless @wagons.include?(wagon)
    end
  end

  def join_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
