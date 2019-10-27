require_relative 'train'
# Cargo Train
class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super
    @type = :cargo
  end

  protected

  def join_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
