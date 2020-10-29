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

  def shoe_name(runlog)
    if runlog.shoe.present?
      runlog.shoe.name
    else
      '未登録'
    end
  end

  def course_name(runlog)
    if runlog.course.present?
      runlog.course.name
    else
      '未登録'
    end
  end
end
