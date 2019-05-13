require 'docking_station.rb'

describe DockingStation do
 it "responds to release bike method" do
	docking_station = DockingStation.new
	docking_station.release_bike

	expect(docking_station).to respond_to(:release_bike)

 end

	it "gets a bike and expects it to be working" do
		bike = Bike.new

		expect(bike.working?).to eq(true)
	end

  it "can dock a bike" do
    station = DockingStation.new

    expect(station.dock_bike).to eq(true)

	end
	
	it "can check a bike is docked" do 
		station = DockingStation.new
		bike = bike

		expect(bike).to respond_to(:docked?)
	end 

end
