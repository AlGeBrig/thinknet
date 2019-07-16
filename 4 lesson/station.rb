class Station
  attr_reader :name, :trains
  def initialize(name)
    @name = name
    @trains = []
    puts "Создана станция #{name}"
  end

  def get_train(train)
    @trains << train
    puts "Поезд #{train} прибыл на станцию #{@name}"
  end

  def all_train
    puts "Поезда на станции #{@name}: #{@trains}"
  end

  def type_train(type)
    @trains.select { |train| train.type == type }.count
  end

  def train_out(train)
    puts "Поезд #{@trains.delete(train)} покидает станцию #{@name}"
    @trains.delete(train)
    end
end
