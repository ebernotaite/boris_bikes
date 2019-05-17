require 'docking_station.rb'

describe DockingStation do
  let(:station){DockingStation.new}
  let(:bike_dbl_working){instance_double('Bike', :working? => true, :report_broken => false, :broken => false)}
  let(:bike_dbl_broken){instance_double('Bike', :working? => false, :report_broken => true, :broken => true)}
  default_capacity = DockingStation::DEFAULT_CAPACITY

	it "gets a bike and expects it to be working" do
		expect(bike_dbl_working.working?).to eq(true)
	end

  it "can dock a bike" do
		expect(station.dock(bike_dbl_working)).to eq([bike_dbl_working])
	end

	it "can show a docked bike" do
	  station.dock(bike_dbl_working)
		expect(station.bikes).to eq([bike_dbl_working])
  end

  it 'can throw error if no bike is docked' do
    expect{station.release_bike}.to raise_error("can't release bike")
  end

	it 'can have a default capacity of 20 bikes' do
		default_capacity.times do
      station.dock(bike_dbl_working)
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
      station.dock(bike_dbl_working)
    end
    expect(station.bikes.count).to eq(30)
  end

  it 'will not go over user specified capacity' do
    station = DockingStation.new(30)
    30.times do
      station.dock(bike_dbl_working)
    end
    expect{station.dock(bike_dbl_working)}.to raise_error "The docking station is full, go away!"
  end

  it 'will not release a broken bike' do
    bike_dbl_broken.report_broken
    station.dock(bike_dbl_broken)
    expect{station.release_bike}.to raise_error("can't release bike")
  end

  it 'will release a working bike' do
    station.dock(bike_dbl_working)
    released_bike = station.release_bike
    expect(released_bike).to be_working
  end

  it 'will accept bikes whether they are broken or not' do
    bike_dbl_broken.report_broken
    station.dock(bike_dbl_broken)
    expect(station.bikes.count).to eq(1)
  end
end


