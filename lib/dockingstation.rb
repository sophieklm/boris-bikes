require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise RuntimeError, "There are no bikes" if empty?
    @bikes.each_index {|i| return @bikes.slice!(i) unless @bikes[i].broken?}
    raise RuntimeError, "There are no working bikes"
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
