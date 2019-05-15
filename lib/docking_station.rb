class DockingStation
  attr_reader :bike
  def initialize
    @bike = nil
  end

  def release_bike
    if @bike == nil
      raise "there is no bike to release"
    else
      bike_to_return = @bike
      @bike = nil
      bike_to_return
    end
  end
  
  def dock(bike)
    @bike ? raise("there is a bike docked already") : @bike = bike
  end
end
