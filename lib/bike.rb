class Bike

  def initialize
    @broken = false
  end
  
  def working?
    if @broken == false
      true
    else
      false
    end
  end
  
  def report_broken
    @broken = true
  end

end