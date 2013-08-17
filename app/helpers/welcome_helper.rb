module WelcomeHelper
  def day_state(day)
    if day.is_current?
      'expanded' 
    else
      'collapsed'
    end
  end
  def day_order(day)
    14 - day.day_number
  end
  def day_view(day)
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
