RSpec.describe "Cal's full month integration" do
  it "should correctly print July 2017" do
    expected = <<EOS
     July 2017      
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31               
EOS
    actual = `./cal 07 2017`
    actual.should == expected
  end

  it "should correctly print December 2014" do
    expected = <<EOS
   December 2014    
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31         
                    
EOS
    actual = `./cal 12 2014`
    actual.should == expected
  end

  it "should accept either numbers or strings to specify a month" do
    expected = <<EOS
   September 2016   
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30   
                    
EOS
    actual_with_number1 = `./cal 9 2016`
    actual_with_number2 = `./cal 09 2016`
    actual_with_string1 = `./cal september 2016`
    actual_with_string2 = `./cal sep 2016`
    actual_with_string3 = `./cal sept 2016`
    actual_with_string4 = `./cal sEpteMber 2016`
    
    actual_with_number1.should == expected
    actual_with_number2.should == expected
    actual_with_string1.should == expected
    actual_with_string2.should == expected
    actual_with_string3.should == expected
    actual_with_string4.should == expected
  end
end
