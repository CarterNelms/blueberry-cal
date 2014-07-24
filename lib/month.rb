require_relative "year"
require_relative "zellers_congruence"

class Month
  MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month < 1 ? 1 : month > 12 ? 12 : month
    @year = year
    @weekday_of_1st = ZellersCongruence.calculate(1, @month, @year)
  end

  def name
    MONTHS[@month-1]
  end

  def header(is_year_in_header=true)
    ("#{name}" + (is_year_in_header ? " #{@year}" : "")).center(20)
  end

  def week(index)
    sunday = 7 * index - @weekday_of_1st + 2
    week = (sunday...sunday+7).map{|day| (day.between?(1,last_day) ? day : nil).to_s.rjust(2)}.join(" ")
  end

  def to_s(is_year_in_header=true)
    header(is_year_in_header) + "\nSu Mo Tu We Th Fr Sa\n" + (0..5).map{|index| week(index)}.join("\n")
  end

  def last_day
    Month.last_day(@month, @year)
  end

  def self.last_day(month, year=2014)
    case month
    when 4, 6, 9, 11
      30
    when 2
      Year.leap?(year) ? 29 : 28
    else
      31
    end
  end
end