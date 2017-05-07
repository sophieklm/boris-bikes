require_relative 'bike'
require_relative 'bike_container'

class DockingStation

  include BikeContainer

  DEFAULT_CAPACITY = 20

  def release_bike
    raise RuntimeError, "There are no bikes" if empty?
    bikes.each_index {|i| return bikes.slice!(i) unless @bikes[i].broken?}
    raise RuntimeError, "There are no working bikes"
  end

  def dock(bike)
    add_bike bike
  end

end
