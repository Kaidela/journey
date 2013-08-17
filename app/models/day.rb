class Day < ActiveRecord::Base
  def human_day_number
    day_number.to_words.humanize
  end
  def is_current?
    day_number == 1
  end
end
