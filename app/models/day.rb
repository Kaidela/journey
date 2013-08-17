class Day < ActiveRecord::Base
  def human_day_number
    day_number.to_words.humanize
  end
  def is_current?
    day_number == 3
  end
  def is_tomorrow?
    day_number == 4
  end
  def is_yesterday?
    day_number == 2
  end
  def is_future?
    day_number >= 5
  end
  def is_past?
    day_number == 1
  end
end
