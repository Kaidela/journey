class Day < ActiveRecord::Base
  def human_day_number
    day_number.to_words.humanize
  end
  def human_date
    date.strftime('%d/%m/%Y')
  end
  def is_current?
    date == Date.today
  end
  def is_tomorrow?
    date == Date.tomorrow
  end
  def is_yesterday?
    date == Date.yesterday
  end
  def is_future?
    date > Date.tomorrow
  end
  def is_past?
    date < Date.yesterday
  end
end
