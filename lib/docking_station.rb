require_relative 'bike'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'no bikes available' if empty?
    bikes.last
  end

  def dock(bike)
    fail 'station at capacity' if full?
    bikes << bike
  end

  private
 
  def full?
    bikes.count >= DEFAULT_CAPACITY
  end
  
  def empty?
    bikes.empty?
  end

end
