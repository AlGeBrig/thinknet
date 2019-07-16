class Train
  attr_reader :number, :current_speed, :all_wagons

  def initialize(number)
    @number = number
    @all_wagons = []
    @current_speed = 0
  end

  def speedup(number)
    @current_speed = number
    puts "Ускорение поезда #{@current_speed}"
  end

  def current_speed
    puts "Текущая скорость поезда: #{@current_speed}"
  end

  def stop
    @current_speed = 0
    puts "Стоп! Скорость поезда: #{@current_speed}"
  end

  # def add_wagon(wagon)
  # if @current_speed == 0
  #   @all_wagons.push(wagon)
  # else
  # puts "There is no way to add wagon while its speed isn't equal to 0"
  # end
  #  puts "Number of wagons = #{@wagons}"
  #  end

  def delete_wagon(wagon)
    if @current_speed == 0 && @all_wagons > 0
      @all_wagons.delete(wagon)
    else
      puts 'Невозможно удалить вагон от поезда'
    end
  end

  def get_route(route)
    @route = route
    @station = 0 unless @route.nil?
  end

  def current_station
    @route.all_stations[@station]
  end

  
  def forward
    return if next_station.nil?
    @station += 1
  end

  def back
    return if prev_station.nil?
    @station -= 1
  end
end

protected  # Вынесено в protected, так как не являются клиентскими методами

def next_station
  @route.all_stations[@station + 1]
end

def prev_station
  @route.all_stations[@station - 1] if @station != 0
end