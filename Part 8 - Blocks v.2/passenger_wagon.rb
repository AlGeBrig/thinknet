require_relative 'wagon'
class PassengerWagon < Wagon
  def initialize(number, capacity)
    super
    @type = :passenger
  end

end
