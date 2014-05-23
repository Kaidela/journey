Day.delete_all
Travel.delete_all
TripUpdate.delete_all

START_DATE = Date.new(2014,5,24)
DESTINATIONS = [
  {:arrive_date => Date.new(2014,5,23), :leave_date => Date.new(2014,5,24), :location => 'Melbourne'},
  {:arrive_date => Date.new(2014,4,24), :leave_date => Date.new(2014,5,27), :location => 'Los Angeles'},
  {:arrive_date => Date.new(2014,5,27), :leave_date => Date.new(2014,5,31), :location => 'New Orleans'},
  {:arrive_date => Date.new(2014,5,31), :leave_date => Date.new(2014,6,6), :location => 'New York'},
  {:arrive_date => Date.new(2014,6,6), :leave_date => Date.new(2014,6,8), :location => 'Washington DC'},
  {:arrive_date => Date.new(2014,6,8), :leave_date => Date.new(2014,6,10), :location => 'Melbourne'},
]

Travel.create(:departure => Time.new(2014,5,24,9,05,0),
  :arrival => Time.new(2014,5,24,14,45,0),
  :number => 'NZ2',
  :mode => 'Flying',
  :stopover => 'Auckland')
Travel.create(:departure => Time.new(2014,5,27,8,00,0),
  :arrival => Time.new(2014,5,27,13,41,0),
  :number => 'Delta 1552',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,5,31,6,15,0),
  :arrival => Time.new(2014,5,31,10,11,0),
  :number => 'Delta 558',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,6,6,6,10,0),
  :arrival => Time.new(2014,6,6,9,45,0),
  :number => '181',
  :mode => 'Training',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,6,8,9,15,0),
  :arrival => Time.new(2014,6,8,11,45,0),
  :number => 'Delta 9250',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,6,8,22,30,0),
  :arrival => Time.new(2014,8,8,10,30,0),
  :number => 'NZ5',
  :mode => 'Flying',
  :stopover => 'Auckland')

Accomodation.create(:arrival => Date.new(2014,5,24),
  :departure => Date.new(2014,5,27),
  :name => 'iHollywood')
Accomodation.create(:arrival => Date.new(2014,5,27),
  :departure => Date.new(2014,5,31),
  :name => 'Grace & Ryans')
Accomodation.create(:arrival => Date.new(2014,5,31),
  :departure => Date.new(2014,6,6),
  :name => 'NYC Apartment')
Accomodation.create(:arrival => Date.new(2014,6,6),
  :departure => Date.new(2014,6,8),
  :name => 'DC Flat')


#TripUpdate.create(:day => Date.new(2013,9,9),
 #  :doing => 'We headed to the fabric market in the morning and the headed to the propaganda art museum in the afternoon.',
  # :eating => 'We had some noodles for lunch around the corner and then some really amazing burgers for dinner.',
  # :highlights => 'The propaganda art museum was pretty interesting. The period is a little swept under the rug here and the museum is located in the basement of an appartment block. A bit creepy, but worthwhile.',
  # :trip_update_images => [
  #  TripUpdateImage.create(file: 'Day11_Img1.jpg'),
  #  TripUpdateImage.create(file: 'Day11_Img2.jpg'),
  #  TripUpdateImage.create(file: 'Day11_Img3.jpg')


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

def day_travel(day_number)
  day = START_DATE + day_number
  day_travels = Travel.select do |travel|
    day == travel.departure.to_date
  end
  return day_travels.first
end

def day_accomodation(day_number)
  day = START_DATE + day_number
  day_accomodations = Accomodation.select do |accomodation|
    day >= accomodation.arrival and day < accomodation.departure
  end
  return day_accomodations.first
end

def day_trip_update(day_number)
  day = START_DATE + day_number
  day_trip_updates = TripUpdate.select do |trip_update|
    day == trip_update.day
  end
  return day_trip_updates.first
end

(0...17).each do |day_number|
  Day.create(:date => START_DATE + day_number,
    :day_number => day_number + 1,
    :start_location => start_location(day_number),
    :end_location => end_location(day_number),
    :travel => day_travel(day_number),
    :accomodation => day_accomodation(day_number),
    :trip_update => day_trip_update(day_number))

end
