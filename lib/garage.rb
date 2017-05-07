require_relative 'bike'
require_relative 'bike_container'

class Garage

  include BikeContainer

  DEFAULT_CAPACITY = 10

  def remove_bikes
    raise RuntimeError, "There are no bikes" if empty?
    bikes.each_index {|i| return bikes.slice!(i) unless @bikes[i].broken?}
    raise RuntimeError, "There are no working bikes"
  end

  def accept_bikes(bike)
    add_bike bike
  end

  def fix_bikes
    bikes.each do |bike|
      bike.fix
    end
  end

end
