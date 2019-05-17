class Van 
  attr_accessor :broken_bikes
  attr_accessor :fixed_bikes

  def initialize 
    @broken_bikes = []
    @fixed_bikes = []
  end

  def take_bikes_to_garage(garage)
    garage.bikes += broken_bikes
  end
end