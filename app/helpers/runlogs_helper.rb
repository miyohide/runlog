module RunlogsHelper
  def total_time_hours_value(total_time)
    if total_time.nil?
      0
    else
      Time.at(total_time).utc.strftime('%H').to_i
    end
  end

  def total_time_minutes_value(total_time)
    if total_time.nil?
      0
    else
      Time.at(total_time).utc.strftime('%M').to_i
    end
  end

  def total_time_seconds_value(total_time)
    if total_time.nil?
      0
    else
      Time.at(total_time).utc.strftime('%S').to_i
    end
  end
end
