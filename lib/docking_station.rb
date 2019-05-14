class DockingStation
  attr_reader :bike
  
  def release_bike
    if @bike == nil
      raise "this is an error"
    else
    Bike.new
    end
  end
  
  def dock(bike)
    @bike = bike
  end

end
