START_DATE = Date.new(2013,8,30)
DESTINATIONS = [
  {:arrive_date => Date.new(2013,8,29), :leave_date => Date.new(2013,8,30), :location => 'Melbourne'},
  {:arrive_date => Date.new(2013,8,31), :leave_date => Date.new(2013,9,4), :location => 'Beijing'},
  {:arrive_date => Date.new(2013,9,5), :leave_date => Date.new(2013,9,7), :location => 'Xi\'an'},
  {:arrive_date => Date.new(2013,9,7), :leave_date => Date.new(2013,9,11), :location => 'Shanghai'},
  {:arrive_date => Date.new(2013,9,11), :leave_date => Date.new(2013,9,13), :location => 'Beijing'},
  {:arrive_date => Date.new(2013,9,14), :leave_date => Date.new(2013,9,14), :location => 'Singapore'},
  {:arrive_date => Date.new(2013,9,15), :leave_date => Date.new(2013,9,16), :location => 'Melbourne'},
]

def destinations_for_day(day)
  DESTINATIONS.select do |destination|
    day >= destination[:arrive_date] and day <= destination[:leave_date]
  end
end

def start_location(day_number)
  day = START_DATE + day_number
  day_destinations = destinations_for_day(day)
  day_destinations.first[:location]
end

def end_location(day_number)
  day = START_DATE + day_number
  day_destinations = destinations_for_day(day)
  tomorrow_destinations = destinations_for_day(day + 1)

  if day_destinations.last[:location] == day_destinations.first[:location]  
    if day_destinations.last[:location] == tomorrow_destinations.first[:location]
      nil
    else
      tomorrow_destinations.first[:location]
    end
  else
    day_destinations.last[:location]
  end
end

(0...17).each do |day_number|
  Day.create(:date => START_DATE + day_number,
    :day_number => day_number + 1,
    :start_location => start_location(day_number),
    :end_location => end_location(day_number))
end
