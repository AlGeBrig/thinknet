require_relative 'wagon'
class PassengerWagon < Wagon
  def initialize(number)
    super
    @type = :passenger
 end
end
