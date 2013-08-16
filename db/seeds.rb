start_date = Date.new(2013,8,30)
(1...14).each do |day_number|
  Day.create(:date => start_date + day_number -1, :day_number => day_number)
end