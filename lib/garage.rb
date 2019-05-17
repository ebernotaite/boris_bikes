class Garage
  attr_accessor :bikes
  def initialize 
    @bikes = []    
  end

  def return_fixed_bike(van)
    @bikes.each do |bike|
    van.fixed_bikes << bike
    end
  end

end