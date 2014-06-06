Day.delete_all
Travel.delete_all

START_DATE = Date.new(2014,5,24)
DESTINATIONS = [
  {:arrive_date => Date.new(2014,5,23), :leave_date => Date.new(2014,5,24), :location => 'Melbourne'},
  {:arrive_date => Date.new(2014,4,24), :leave_date => Date.new(2014,5,27), :location => 'Los Angeles'},
  {:arrive_date => Date.new(2014,5,27), :leave_date => Date.new(2014,5,31), :location => 'New Orleans'},
  {:arrive_date => Date.new(2014,5,31), :leave_date => Date.new(2014,6,6), :location => 'New York'},
  {:arrive_date => Date.new(2014,6,6), :leave_date => Date.new(2014,6,8), :location => 'Washington DC'},
  {:arrive_date => Date.new(2014,6,8), :leave_date => Date.new(2014,6,10), :location => 'Melbourne'},
]

Travel.create(:departure => Time.new(2014,5,24,9,05,0, "+10:00"),
  :arrival => Time.new(2014,5,24,14,45,0, "+10:00"),
  :number => 'NZ2',
  :mode => 'Flying',
  :stopover => 'Auckland')
Travel.create(:departure => Time.new(2014,5,27,8,00,0, "+10:00"),
  :arrival => Time.new(2014,5,27,13,41,0, "+10:00"),
  :number => 'Delta 1552',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,5,31,6,15,0, "+10:00"),
  :arrival => Time.new(2014,5,31,10,11,0, "+10:00"),
  :number => 'Delta 558',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,6,6,6,10,0, "+10:00"),
  :arrival => Time.new(2014,6,6,9,45,0, "+10:00"),
  :number => '181',
  :mode => 'Training',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,6,8,9,15,0, "+10:00"),
  :arrival => Time.new(2014,6,8,11,45,0, "+10:00"),
  :number => 'Delta 9250',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2014,6,8,22,30,0, "+10:00"),
  :arrival => Time.new(2014,8,8,10,30,0, "+10:00"),
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

day = Day.find_by(day_number: 1)
day.trip_update = TripUpdate.create(
   :doing => 'We landed in LA after 24 hours of travel.',
   :eating => 'We dove straight into American cuisine with bags of crawfish and shrimp.',
   :highlights => 'While on the shuttle bus to pick up a hire car I saw Jonno waiting on the curb at LAX, jumping up to wave I fell into a kid as the bus stopped. Classic.',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day1_Img1.jpg'),
    TripUpdateImage.create(file: 'Day1_Img2.jpg'),
    TripUpdateImage.create(file: 'Day1_Img3.jpg'),
    TripUpdateImage.create(file: 'Day1_Img4.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 2)
day.trip_update = TripUpdate.create(
   :doing => 'We headed to Santa Monica for some time on the beach and then some star gazing at Griffith Observatory.',
   :eating => 'We started the day with waffles and then after an epic 12 hours we grabbed some late night burgers.',
   :highlights => 'A whole day of driving and no accidents, winning.',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day2_Img1.jpg'),
    TripUpdateImage.create(file: 'Day2_Img2.jpg'),
    TripUpdateImage.create(file: 'Day2_Img3.jpg'),
    TripUpdateImage.create(file: 'Day2_Img4.jpg'),
    TripUpdateImage.create(file: 'Day2_Img5.jpg'),
    TripUpdateImage.create(file: 'Day2_Img6.jpg'),
    TripUpdateImage.create(file: 'Day2_Img7.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 3)
day.trip_update = TripUpdate.create(
   :doing => 'DISNEY LAND: the most magical place on earth.',
   :eating => 'Ate more sugar than I\'m willing to freely admit.',
   :highlights => 'We got in super early and the park was quiet, so we rode Space Mountain twice! It was amazing.',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day3_Img1.jpg'),
    # TripUpdateImage.create(file: 'Day3_Img2.jpg'),
    TripUpdateImage.create(file: 'Day3_Img3.jpg'),
    TripUpdateImage.create(file: 'Day3_Img4.jpg'),
    TripUpdateImage.create(file: 'Day3_Img5.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 4)
day.trip_update = TripUpdate.create(
   :doing => 'Upgraded from LA (city) to LA (state).',
   :eating => 'Got acquainted with New Orleans Po Boys.',
   :highlights => nil,
   :trip_update_images => [],
)
day.save!

day = Day.find_by(day_number: 5)
day.trip_update = TripUpdate.create(
   :doing => 'We explored the city and continued on our quest for a decent coffee.',
   :eating => 'No decent coffee, but I had an amazing crawfish pie.',
   :highlights => 'Spent the evening nibbling on cheese and whining about American coffee with a couple of other travellers.',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day5_Img1.jpg'),
    TripUpdateImage.create(file: 'Day5_Img2.jpg'),
    TripUpdateImage.create(file: 'Day5_Img3.jpg'),
    TripUpdateImage.create(file: 'Day5_Img4.jpg'),
    TripUpdateImage.create(file: 'Day5_Img6.jpg'),
    TripUpdateImage.create(file: 'Day5_Img7.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 6)
day.trip_update = TripUpdate.create(
   :doing => 'We took a drive out of the city to Oak Alley plantation.',
   :eating => 'Devoured a slice of sweet potato pie; why do we not have this?',
   :highlights => 'On the drive back in we saw our first alligator in the swamp, then we had alligator sausage for dinner.',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day6_Img1.jpg'),
    TripUpdateImage.create(file: 'Day6_Img2.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 9)
day.trip_update = TripUpdate.create(
   :doing => 'We spent our first full day in NYC relaxing in the park and hitting the shops.',
   :eating => 'We had our first slice New York pizza. Yum!',
   :highlights => 'Discovered the most magical toy store yet!',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day9_Img1.jpg'),
    TripUpdateImage.create(file: 'Day9_Img2.jpg'),
    TripUpdateImage.create(file: 'Day9_Img3.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 10)
day.trip_update = TripUpdate.create(
   :doing => 'We headed to the 9/11 Memorial and took a stroll across Brooklyn Bridge.',
   :eating => 'More pizza, this time it was a 10/10!',
   :highlights => 'The memorial was massive and very moving, could have spent the entire day there.',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day10_Img1.jpg'),
    TripUpdateImage.create(file: 'Day10_Img2.jpg'),
    TripUpdateImage.create(file: 'Day10_Img3.jpg'),
    TripUpdateImage.create(file: 'Day10_Img4.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 11)
day.trip_update = TripUpdate.create(
   :doing => 'We spent the day discovering dinosaurs at the Natural History Museum before heading to the Brox to see the Yankees.',
   :eating => 'Hot dogs and beer at the baseball!',
   :highlights => 'I posed with a tri-SARAH-tops!',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day11_Img1.jpg'),
    TripUpdateImage.create(file: 'Day11_Img2.jpg'),
    TripUpdateImage.create(file: 'Day11_Img3.jpg'),
    TripUpdateImage.create(file: 'Day11_Img4.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 12)
day.trip_update = TripUpdate.create(
   :doing => 'We took the ferry to Statten Island (past the statue) and then wen\'t to Top of the Rock for great views.',
   :eating => 'Late night pizza for $1.',
   :highlights => 'We went up 67th floors in under 45 seconds! Views = WOW!',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day12_Img1.jpg'),
    TripUpdateImage.create(file: 'Day12_Img2.jpg'),
    TripUpdateImage.create(file: 'Day12_Img3.jpg'),
    TripUpdateImage.create(file: 'Day12_Img4.jpg'),
    TripUpdateImage.create(file: 'Day12_Img5.jpg'),
    TripUpdateImage.create(file: 'Day12_Img6.jpg')
  ]
)
day.save!

day = Day.find_by(day_number: 13)
day.trip_update = TripUpdate.create(
   :doing => 'We toured the United Nations, nuff said.',
   :eating => 'I ate an organic chia seed pudding for breakfast, closest we\'ve been to reall food in days.',
   :highlights => 'The UN, duh! I dreamed of the day I would be here!!!',
   :trip_update_images => [
    TripUpdateImage.create(file: 'Day13_Img1.jpg')
  ]
)
day.save!
