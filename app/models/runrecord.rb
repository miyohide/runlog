class Runrecord < ActiveRecord::Base
  def pace
    pace_by_second = runtime_to_seconds / self.distance
    second_to_minute(pace_by_second)
  end

  def runtime_to_seconds
    runtime_second = 0
    self.run_time.split(":").each_with_index do |i, idx|
      runtime_second += i.to_i * ( 60 ** ( 2 - idx ) )
    end
    runtime_second
  end

  def second_to_minute(pace)
    q, r = pace.divmod(60)
    sprintf("%02d:%02d", q, r)
  end
end
