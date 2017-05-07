require_relative 'bike'
require_relative 'bike_container'

class Van

  include BikeContainer

  DEFAULT_CAPACITY = 5

  def collect_broken_bike(bike)
    add_bike bike if bike.broken?
  end

  def deliver_bikes
    raise RuntimeError, "There are no broken bikes" if empty?
    bikes.each_index {|i| return bikes.slice!(i) if @bikes[i].broken?}
  end

end
