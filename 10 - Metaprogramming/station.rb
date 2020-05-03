require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'
# Station class
class Station
  include InstanceCounter
  include Validation
  include Accessors

  NAME_FORMAT = /^[a_zA-Z]{7}[0-9]$/

  attr_reader :name, :trains_on_station
  attr_accessor :name

  attr_accessor_with_history :trains_on_station
  strong_attr_accessor :trains_on_station, String

  Station.all_stations = []

  def initialize(name)
    valid_presence(name)
    @name = name
    valid_format(name, NAME_FORMAT )
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
