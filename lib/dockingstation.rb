require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise RuntimeError, "There are no bikes" if @bikes.empty?
    @bikes
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if @bikes.count >= 20
    @bikes << bike
  end

end
