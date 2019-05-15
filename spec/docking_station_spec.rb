require 'docking_station.rb'

describe DockingStation do
  let(:station){DockingStation.new}
  let(:bike){Bike.new}
  default_capacity = DockingStation::DEFAULT_CAPACITY

	it "gets a bike and expects it to be working" do
		expect(bike.working?).to eq(true)
	end

  it "can dock a bike" do
		expect(station.dock(bike)).to eq([bike])
	end


	it "can show a docked bike" do
	  station.dock(bike)
		expect(station.bikes).to eq([bike])
  end

  it 'can throw error if no bike is docked' do
    expect{station.release_bike}.to raise_error("there is no bike to release")
  end

  it 'can throw error if there is a bike docked already' do
    default_capacity.times do
    	station.dock(bike)
		end

    expect{station.dock(bike)}.to raise_error("The docking station is full, go away!")
  end

	it 'can have a default capacity of 20 bikes' do
		default_capacity.times do
			station.dock(bike)
		end

		expect(station.bikes.count).to eq(default_capacity)
  end
  
  it 'can have a non-default capacity' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq(30)
  end

  it 'uses user specified capacity' do
    station = DockingStation.new(30)
    30.times do
      station.dock(bike)
    end
    expect(station.bikes.count).to eq(30)
  end

  it 'will not go over user specified capacity' do
    station = DockingStation.new(30)
    30.times do
      station.dock(bike)
    end
    expect{station.dock(bike)}.to raise_error "The docking station is full, go away!"
  end
end
