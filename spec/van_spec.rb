require 'van.rb'
require 'docking_station.rb'

describe 'Van' do
  let(:van){Van.new}
  let(:station){DockingStation.new}
  let(:garage){Garage.new}
  let(:bike_dbl_broken){instance_double('Bike', :working? => false, :report_broken => true, :broken => true)}
  let(:bike_dbl_working){instance_double('Bike', :working? => true, :report_broken => false, :broken => false)}

  it 'can take a broken bike from a docking station' do
    broken_bike = station.dock(bike_dbl_broken)
    van_bike = station.release_broken_bike(van)
    expect(van.broken_bikes).to eq([bike_dbl_broken])
  end

  it 'can collect working bikes from the garage' do
    garage.bikes << bike_dbl_working
    garage.return_fixed_bike(van)
    expect(van.fixed_bikes).to eq([bike_dbl_working])
  end
end