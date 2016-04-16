require_relative 'docking_station'

class Van
    
  def initialize
    @broken_bikes = []
  end
  
  def take_broken_bikes(station)
      station.bikes.each { |b| @broken_bikes << b if b.working? == false }
      @broken_bikes
  end

end