require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(default = 20)
    @bikes = []
    @capacity = default
  end

  def release_bike
    raise RuntimeError, "There are no bikes" if empty?
    @bikes.shift
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
