class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.count == 0
  end
end
