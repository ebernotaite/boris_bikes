class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    empty? || @bikes[-1].broken ? raise("can't release bike") : @bikes.pop
  end

  def dock(bike, broken)
    bike.broken = broken
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
