module DayHelper
	def day_detail_class(day)
		if day.is_current?
      'today'
    elsif day.is_tomorrow?
      'tomorrow'
    elsif day.is_yesterday?
      'yesterday'
    elsif day.is_future?
      'future'
    elsif day.is_past?
      'past'
    end
	end
end
