require_relative '../lib/month'

RSpec.describe Month do
  context ".header" do
    it "matches cal for December 2012" do
      month = Month.new(12, 2012)
      month.header.should == "   December 2012    "
    end
    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header(true).should == "     July 1901      "
    end
    it "matches cal for December 2012 without the year" do
      month = Month.new(12, 2012)
      month.header(false).should == "      December      "
    end
    it "matches cal for July 1901 without the year" do
      month = Month.new(07, 1901)
      month.header(false).should == "        July        "
    end
  end

  context ".name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end
    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end
    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end
    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end
  end

  context ".week" do
    it "returns a single row of a month" do
      Month.new(7, 2014).week(0).should == "       1  2  3  4  5"
    end
  end

  context ".last_day" do
    it "returns 31 for Jan" do
      Month.last_day(1, 2014).should == 31
    end
    it "returns 28 or 29 for Feb, depending on whether the year is a leap year" do
      Month.last_day(2, 2014).should == 28
      Month.last_day(2, 2016).should == 29
    end
    it "returns 31 for Mar" do
      Month.last_day(3, 2014).should == 31
    end
    it "returns 30 for Apr" do
      Month.last_day(4, 2014).should == 30
    end
    it "returns 31 for May" do
      Month.last_day(5, 2014).should == 31
    end
    it "returns 30 for Jun" do
      Month.last_day(6, 2014).should == 30
    end
    it "returns 31 for Jul" do
      Month.last_day(7, 2014).should == 31
    end
    it "returns 31 for Aug" do
      Month.last_day(8, 2014).should == 31
    end
    it "returns 30 for Sep" do
      Month.last_day(9, 2014).should == 30
    end
    it "returns 31 for Oct" do
      Month.last_day(10, 2014).should == 31
    end
    it "returns 30 for Nov" do
      Month.last_day(11, 2014).should == 30
    end
    it "returns 31 for Dec" do
      Month.last_day(12, 2014).should == 31
    end
    it "returns the same whether called as an instance method or a class method" do
      Month.last_day(10, 2016).should == Month.new(10, 2016).last_day
    end
  end

  # context ".zellers" do
  #   it "call ZellerCongruence.calculate using a month instance's month and year" do
  #     day_of_the_week = Month.new(7, 2014).zellers(18)
  #     day_of_the_week.should == 6
  #   end
  # end

  # context ".is_valid?" do
  #   it "returns true if the month specified exists, false otherwise" do
  #     Month.is_valid?(1).should == true
  #     Month.is_valid?(6).should == true
  #     Month.is_valid?(12).should == true
  #     Month.is_valid?(0).should == false
  #     Month.is_valid?(-2).should == false
  #     Month.is_valid?(14).should == false
  #   end
  # end
end