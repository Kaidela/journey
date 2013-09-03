Day.delete_all
Travel.delete_all
TripUpdate.delete_all

START_DATE = Date.new(2013,8,30)
DESTINATIONS = [
  {:arrive_date => Date.new(2013,8,29), :leave_date => Date.new(2013,8,30), :location => 'Melbourne'},
  {:arrive_date => Date.new(2013,8,31), :leave_date => Date.new(2013,9,4), :location => 'Beijing'},
  {:arrive_date => Date.new(2013,9,5), :leave_date => Date.new(2013,9,7), :location => 'Xi\'an'},
  {:arrive_date => Date.new(2013,9,7), :leave_date => Date.new(2013,9,11), :location => 'Shanghai'},
  {:arrive_date => Date.new(2013,9,11), :leave_date => Date.new(2013,9,14), :location => 'Beijing'},
  {:arrive_date => Date.new(2013,9,15), :leave_date => Date.new(2013,9,16), :location => 'Melbourne'},
]

Travel.create(:departure => Time.new(2013,8,30,11,0,0),
  :arrival => Time.new(2013,8,31,1,10,0),
  :number => 'JQ7',
  :mode => 'Flying',
  :stopover => 'Singapore')
Travel.create(:departure => Time.new(2013,9,4,20,30,0),
  :arrival => Time.new(2013,9,5,9,0,0),
  :number => 'T43',
  :mode => 'Training',
  :stopover => nil)
Travel.create(:departure => Time.new(2013,9,7,12,15,0),
  :arrival => Time.new(2013,9,7,14,15,0),
  :number => 'CA1215',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2013,9,11,16,55,0),
  :arrival => Time.new(2013,9,11,19,15,0),
  :number => ' CA1518',
  :mode => 'Flying',
  :stopover => nil)
Travel.create(:departure => Time.new(2013,9,14,2,40,0),
  :arrival => Time.new(2013,9,15,6,45,0),
  :number => ' CJQ8',
  :mode => 'Flying',
  :stopover => 'Singapore')

Accomodation.create(:arrival => Date.new(2013,8,31),
  :departure => Date.new(2013,9,4),
  :name => 'Hutongren Courtyard Hotel')
Accomodation.create(:arrival => Date.new(2013,9,5),
  :departure => Date.new(2013,9,7),
  :name => 'Zuo You Ke Theme Hotel')
Accomodation.create(:arrival => Date.new(2013,9,7),
  :departure => Date.new(2013,9,11),
  :name => 'Quintet Bed & Breakfast')
Accomodation.create(:arrival => Date.new(2013,9,11),
  :departure => Date.new(2013,9,14),
  :name => ' The Orchid Hotel')

TripUpdate.create(:day => Date.new(2013,8,30),
   :doing => 'Traveling.',
   :eating => 'Plane food, yum!',
   :highlights => 'Ryan says "watching the whole first season of Breaking Bad and still have 30% battery left".')
   #:image_1 => nil,
   #:image_2 => nil,
   #:image_3 => nil)

TripUpdate.create(:day => Date.new(2013,8,31),
   :doing => 'Sightseeing at the Forbidden City & Tiananmen Square.',
   :eating => 'Breakfast and lunch at a great cafe down the lane from our hotel. Downside is that the average price for a latte over here is 45Y!',
   :highlights => 'Getting from one end to the other of the Forbidden City! We walked about 15km in total...',
   :image_1 => 'Day2_Img1.jpg',
   :image_2 => 'Day2_Img2.jpg',
   :image_3 => 'Day2_Img3.jpg')

TripUpdate.create(:day => Date.new(2013,9,1),
   :doing => 'We cycled around the city. I am still alive Mum!',
   :eating => 'Some awesome street food. Had the best egg tart type things and some tasty - I assume - chicken.',
   :highlights => 'Staying alive despite the rather loose grasp on the road rules that the locals seem to have! Oh, and I bought an ocarina!',
   :image_1 => 'Day3_Img1.jpg',
   :image_2 => 'Day3_Img2.jpg',
   :image_3 => 'Day3_Img3.jpg')

TripUpdate.create(:day => Date.new(2013,9,2),
   :doing => 'We travelled up to the Great Wall at Badaling and went for one hell of a walk.',
   :eating => 'Some more street food. I had to try very hard not to think about what the meat was in some cases. Bonus: I have convinced Ryan to eat a scorpion!',
   :highlights => 'Making it up to the peak of the wall. We took the south route as it was less busy... The +60 degree incline was the reason it was less busy!',
   :image_1 => 'Day4_Img1.jpg',
   :image_2 => 'Day4_Img2.jpg',
   :image_3 => 'Day4_Img3.jpg')

TripUpdate.create(:day => Date.new(2013,9,3),
   :doing => 'We did some more walking at the Summer Palace and then headed out for some late night shopping (which is every night!).',
   :eating => 'Ryan found the Chinese Bread Top and ate like a fatty.',
   :highlights => 'Getting back onto the MRT after the mugginess of the Summer Palace. Plus I bought socks and we discovered the largest EVER book store! Downside: it was all in Chinese... Go figure.',
   :image_1 => 'Day5_Img1.jpg',
   :image_2 => 'Day5_Img2.jpg',
   :image_3 => 'Day5_Img3.jpg')

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
