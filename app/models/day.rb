class Day < ActiveRecord::Base
  belongs_to :travel
  belongs_to :accomodation
  belongs_to :trip_update
  def human_day_number
    day_number.to_words.humanize
  end
  def human_date
    date.strftime('%d/%m/%Y')
  end
  def is_current?
    date.to_date == Date.today
  end
  def is_tomorrow?
    date.to_date == Date.tomorrow
  end
  def is_yesterday?
    date.to_date == Date.yesterday
  end
  def is_future?
    date.to_date > Date.tomorrow
  end
  def is_past?
    date.to_date < Date.yesterday
  end
end
