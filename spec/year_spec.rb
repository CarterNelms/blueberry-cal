require_relative '../lib/year'

RSpec.describe Year do
  context ".leap?" do
    it "returns true for a leap year, false otherwise" do
      Year.leap?(2014).should == false
      Year.leap?(2016).should == true
    end
    # it "returns the same whether called as an instance method or a class method" do
    #   Year.leap?(2014).should == Year.new(2014).leap?
    #   Year.leap?(2016).should == Year.new(2016).leap?
    # end
  end

  context ".in_range?" do
    it "returns true if the year given is within the calender's range, false otherwise" do
      Year.in_range?(2000).should == true
      Year.in_range?(3000).should == true
      Year.in_range?(1800).should == true
      Year.in_range?(1000).should == false
      Year.in_range?(1799).should == false
      Year.in_range?(3001).should == false
      Year.in_range?(4865).should == false
    end
  end

  context ".header" do
    it "returns the year as a string centered over a calender" do
      Year.new(2014).header.should == "                            2014                                "
    end
  end
end