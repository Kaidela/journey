START_DATE = Date.new(2013,8,30)
DESTINATIONS = [
  {:arrive_date => Date.new(2013,8,29), :leave_date => Date.new(2013,8,30), :location => 'Melbourne'},
  {:arrive_date => Date.new(2013,8,31), :leave_date => Date.new(2013,9,5), :location => 'Beijing'},
  {:arrive_date => Date.new(2013,9,6), :leave_date => Date.new(2013,9,8), :location => 'Xi\'an'},
  {:arrive_date => Date.new(2013,9,8), :leave_date => Date.new(2013,9,12), :location => 'Shanghai'},
  {:arrive_date => Date.new(2013,9,12), :leave_date => Date.new(2013,8,13), :location => 'Beijing'},
  {:arrive_date => Date.new(2013,9,14), :leave_date => Date.new(2013,9,14), :location => 'Singapore'},
  {:arrive_date => Date.new(2013,9,15), :leave_date => Date.new(2013,9,15), :location => 'Melbourne'},
]

def start_location(day_number)
  day = START_DATE + day_number
  day_destinations = DESTINATIONS.select do |destination|
    destination[:arrive_date] >= day and destination[:leave_date] <= day
  end
  day_destinations.first[:location]
end

def end_location(day_number)
  day = START_DATE + day_number
  day_destinations = DESTINATIONS.select do |destination|
    destination[:arrive_date] >= day and destination[:leave_date] <= day
  end
  day_destinations.last[:location]
end

(0...14).each do |day_number|
  Day.create(:date => START_DATE + day_number,
    :day_number => day_number + 1,
    :start_location => start_location(day_number),
    :end_location => end_location(day_number))
end
