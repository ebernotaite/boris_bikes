require 'docking_station.rb'

describe DockingStation do
  let(:station){DockingStation.new}
  let(:bike){Bike.new}

	it "gets a bike and expects it to be working" do
		expect(bike.working?).to eq(true)
	end

  it "can dock a bike" do
		expect(station.dock(bike)).to eq(bike)
	end


	it "can show a docked bike" do
	  station.dock(bike)
		expect(station.bike).to eq(bike)
  end
  
  it 'can throw error if no bike is docked' do
    expect{station.release_bike}.to raise_error("there is no bike to release")
  end

  it 'can throw error if there is a bike docked already' do
    station.dock(bike)
    expect{station.dock(bike)}.to raise_error("there is a bike docked already")
  end
end
