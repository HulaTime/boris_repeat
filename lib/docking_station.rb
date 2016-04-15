require_relative 'bike'

class DockingStation

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
    bikes.count >= 20
  end
  
  def empty?
    bikes.count <= 0
  end

end
