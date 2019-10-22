require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'manage'
require_relative 'wagon'
require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'

puts 'Управляющий интерфейс'
start = Manage.new
start.choose
