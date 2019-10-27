require_relative 'instance_counter'
require_relative 'validation'
# Station class
class Station
  include InstanceCounter
  include Validation
  attr_reader :name, :trains_on_station

  Station.all_stations = []

  def initialize(name)
    @name = name
    validate!
    @trains_on_station = []
    @@all_stations << self
    register_instance
  end

  def each_train
    @trains_on_station.each { |train| yield(train) }
  end

  def get_train(train)
    @trains_on_station << train
  end

  def type_train(type)
    @trains.select { |train| train.type == type }.count
  end

  def train_out(train)
    @trains_on_station.delete(train)
  end

  def self.all_stations
    p @@all_stations
  end

  def validate!
    raise 'Название станции должно быть короче 3 символов' if @name.length <= 3
  end
end
