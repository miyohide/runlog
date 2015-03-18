class ActiveSupport::TimeWithZone
  def utc_to_ja
    self.in_time_zone("Tokyo")
  end
end
