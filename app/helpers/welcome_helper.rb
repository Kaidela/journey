module WelcomeHelper
  def day_state(day)
    if day.is_current?
      'expanded' 
    else
      'collapsed'
    end
  end

  def day_order(day)
    Day.all.count - day.day_number
  end

  def day_view(day)
    puts day.date
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

  def day_locations(day)
    if day.end_location
      day.start_location + ' to ' + day.end_location
    elsif day.end_location == nil
      day.start_location
    end
  end
  def day_update_state(day)
    if day.trip_update.nil?
      return 'disabled'
    end
  end
end

