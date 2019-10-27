require_relative 'wagon'
# Cargo Wagon
class CargoWagon < Wagon
  def initialize(number, capacity)
    super
    @type = :cargo
  end
end
