require_relative "train"

class PassengerTrain < Train
attr_reader :type

def initialize(number)
super
@type = :passenger 
end

def connect_wagon(wagon)
    if @current_speed == 0 && wagon.type == :passenger
        unless @wagons.include?(wagon)
            @wagons << wagon
        end
    end
end

def join_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
end

end