require_relative 'instance_counter'
require_relative 'validation'
class Route
  FIRST_LAST_STATION_ERROR = 'Начальная и конечная станция не могут совпадать'.freeze

  include InstanceCounter
  include Validation
  attr_reader :first_station, :last_station, :all_stations

  def initialize(first_station, last_station)
    @all_stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
    validate!
    register_instance
  end

  def add_station(station)
    @all_stations.insert(-2, station) unless @all_stations.include?(station)
    puts " Все станции:#{@all_stations}"
    end

  def delete_station(station)
    @all_stations.delete(station) if (@all_stations[0] != station) && (@all_stations[-1] != station)
  end

  def validate!
    raise FIRST_LAST_STATION_ERROR if @first_station == @last_station
  end
end
