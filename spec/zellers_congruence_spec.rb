require_relative "../lib/zellers_congruence.rb"

RSpec.describe "Zeller's Congruence" do
  context ".calculate" do
    it "returns 6 (Fr) for 18 July 2014 (the day this test was written)" do
      day_of_the_week = ZellersCongruence.calculate(18, 7, 2014)
      day_of_the_week.should == 6
    end
    it "returns 2 (Mo) for leapday of 2016" do
      day_of_the_week = ZellersCongruence.calculate(29, 2, 2016)
      day_of_the_week.should == 2
    end
    it "returns 6 (Fr) for New Year's Day of 2021" do
      day_of_the_week = ZellersCongruence.calculate(1, 1, 2021)
      day_of_the_week.should == 6
    end
    it "returns nil for a day that exists in no month" do
      day_of_the_week = ZellersCongruence.calculate(0, 1, 2014)
      day_of_the_week.should == nil
    end
    it "returns nil for a day that exists in some months, but not in the selected month" do
      day_of_the_week = ZellersCongruence.calculate(30, 2, 2014)
      day_of_the_week.should == nil
      day_of_the_week = ZellersCongruence.calculate(29, 2, 2014)
      day_of_the_week.should == nil
      day_of_the_week = ZellersCongruence.calculate(29, 2, 2016)
      day_of_the_week.should == 2
    end
    it "returns nil for a month that does not exist" do
      day_of_the_week = ZellersCongruence.calculate(1, 0, 2014)
      day_of_the_week.should == nil
    end
    it "returns nil for a year that is out of this calender's range" do
      day_of_the_week = ZellersCongruence.calculate(1, 1, 1000)
      day_of_the_week.should == nil
      day_of_the_week = ZellersCongruence.calculate(1, 1, 10000)
      day_of_the_week.should == nil
    end
  end
end