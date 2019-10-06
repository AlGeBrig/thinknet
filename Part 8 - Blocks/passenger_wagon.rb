require_relative 'wagon'
class PassengerWagon < Wagon
  def initialize(number, seats)
    super(number)
    @seats = seats
    @seats_occupied = 0
    @type = :passenger
  end

 def take_seat
  if @seats_occupied < @seats
    @seats_occupied += 1 
  else 
    raise "No more seats"
  end
 end

def seats_occupied
  @seats_occupied
end

def seats_free
  @seats - @seats_occupied
end

end
