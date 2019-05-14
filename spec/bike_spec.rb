require 'bike.rb'

describe Bike do 
    it 'responds to working? method' do 
        bike = Bike.new
        
        expect(bike).to respond_to(:working?)
    end 

    it "can respond to docked" do 
      bike = Bike.new
  
      expect(bike).to respond_to(:docked?)
    end 
end