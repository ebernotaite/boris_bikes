class Bike
  attr_accessor :broken

  def report_broken
    @broken = true
  end

	def working? 
    @broken ? false : true
  end
end