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
end
