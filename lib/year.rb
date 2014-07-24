class Year
  MINIMUM_YEAR = 1800
  MAXIMUM_YEAR = 3000

  def initialize(year)
    @year = year < MINIMUM_YEAR ? MINIMUM_YEAR : year > MAXIMUM_YEAR ? MAXIMUM_YEAR : year
    @months = (1..12).map{|month| Month.new(month, @year)}
  end

  def header
    @year.to_s.center(60) + "    "
  end

  def to_s
    header + "\n" + (0..3).map{|row|
      month_lines = @months[3*row,3].map{|month| month.to_s(false).split("\n")}
      (0...month_lines[0].size).map{|line| (0...month_lines.size).map{|m| month_lines[m][line]}.join("  ")}.join("\n")
    }.join("\n\n")
  end

  def self.in_range?(year)
    year.between?(MINIMUM_YEAR,MAXIMUM_YEAR)
  end

  def self.leap?(year)
    year%4 == 0 && (year%100 != 0 || year%400 == 0)
  end
end