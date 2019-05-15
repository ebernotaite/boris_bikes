class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    empty? ? raise("there is no bike to release") : @bikes.pop
  end

  def dock(bike)
    full? ? raise("The docking station is full, go away!")
                          : @bikes << bike
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.count == 0
  end
end
