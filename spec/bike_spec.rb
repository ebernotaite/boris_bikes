require 'bike.rb'

describe Bike do 

  let(:bike){Bike.new}
  let(:docking_station){DockingStation.new}

  it 'responds to working? method' do 
    expect(bike).to respond_to(:working?)
  end 

  it 'can be reported as broken on return to docking station' do
    docking_station.dock(bike, true)
    expect(bike.broken).to eq true
  end
end