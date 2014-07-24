class ZellersCongruence
  def self.calculate(day, month, year)
    if day.class == Fixnum && month.class == Fixnum && year.class == Fixnum
      if day.between?(1,Month.last_day(month, year)) && month.between?(1,12) && Year.in_range?(year)
        month, year = month + 12, year - 1 if month.between?(1,2)
        (day + ((month + 1)*13/5).floor + year + (year/4).floor + 6*(year/100).floor + (year/400).floor - 1) % 7 + 1
      end
    end
  end
end