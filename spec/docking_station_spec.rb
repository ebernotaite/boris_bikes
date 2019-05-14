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
		bike = Bike.new

    expect(station.dock(bike)).to eq(bike)
	end


	it "can show a docked bike" do
		docking_station = DockingStation.new
		bike = Bike.new

		docking_station.dock(bike)
		
		expect(docking_station.bike).to eq(bike)
	end

end
