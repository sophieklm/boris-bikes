require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    raise RuntimeError, "There are no bikes" unless @bike
    @bike
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if @bike
    @bike = bike
  end

end
