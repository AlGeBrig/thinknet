require_relative 'instance_counter'
class Station
  include InstanceCounter
  attr_reader :name, :trains_on_station

  @@all_stations = {}

  def initialize(name)
    @name = name
    @trains_on_station = []
    puts "Создана станция #{name}"
    @@all_stations[name] = self
    self.register_instance
  end

  def get_train(train)
    @trains_on_station << train
    puts "Поезд #{train} прибыл на станцию #{@name}"
  end

  def all_train
    puts "Поезда на станции #{@name}: #{@trains_on_station}"
  end

  def type_train(type)
    @trains.select { |train| train.type == type }.count
  end

  def train_out(train)
    puts "Поезд #{@trains_on_station.delete(train)} покидает станцию #{@name}"
    @trains_on_station.delete(train)
  end

  def self.all_stations
    @@all_stations.values
  end
end
