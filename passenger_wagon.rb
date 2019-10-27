require_relative 'wagon'
# Passenger wagon
class PassengerWagon < Wagon
  def initialize(number, capacity)
    super
    @type = :passenger
  end
end
