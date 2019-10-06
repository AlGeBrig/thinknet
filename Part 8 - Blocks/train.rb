require_relative './manufacturer.rb'
require_relative './instance_counter.rb'
require_relative './validation.rb'
class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  attr_reader :number, :current_speed, :all_wagons

  @@all_trains = {}
  def initialize(number)
    @number = number
    validate!
    @all_wagons = []
    @current_speed = 0
    @station_number = 0
    @@all_trains[number] = self
    register_instance
  end

  def all_train_wagons
    @all_wagons.each {|wagon| yield(wagon)}
  end

  def self.find(number)
    @@all_trains[number]
 end

  def self.all_trains
    puts @@all_trains
  end

  def speedup(number)
    @current_speed += number
    @current_speed
  end

  def stop
    @current_speed = 0
  end

  def connect_wagon(wagon)
    if @current_speed == 0 && (wagon.type == :cargo || wagon.type == :passenger)
      @all_wagons << wagon unless @all_wagons.include?(wagon)
    end
 end

  def delete_wagon(wagon)
    if @current_speed == 0 && @all_wagons > 0
      @all_wagons.delete(wagon)
    else
      puts 'Невозможно удалить вагон от поезда'
    end
  end

  def get_route(route)
    @route = route
    @station_number = 0 unless @route.nil?
    current_station.get_train(self)
  end

  def forward
    return if next_station.nil?
    current_station.train_out(self)
    next_station.get_train(self)
    @station_number += 1
  end

  def back
    return if prev_station.nil?
    current_station.train_out(self)
    prev_station.get_train(self)
    @station_number -= 1
  end

  def current_station
    @route.all_stations[@station_number]
  end

  private

  def next_station
    @route.all_stations[@station_number + 1]
  end

  def prev_station
    @route.all_stations[@station_number - 1] if @station_number != 0
  end

  def validate!
    raise 'Ошибка: Формат номера поезда: три буквы или цифры в любом порядке, необязательный дефис, 2 буквы или цифры после дефиса' if @number !~ /^[a-z0-9]{3}-*[a-z0-9]{2}$/i
   end
end
