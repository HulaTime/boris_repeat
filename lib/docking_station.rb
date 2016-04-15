require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end


  def release_bike
    fail 'no bikes available' if @bikes.count == 0
    @bikes.last
  end

  def dock(bike)
    fail 'station at capacity' if @bikes.count == 20
    @bikes << bike
  end

end
