require 'docking_station.rb'

describe DockingStation do
 it "responds to release bike method" do
   docking_station = DockingStation.new
   docking_station.release_bike

   expect(docking_station).to respond_to(release_bike)

 end
end
