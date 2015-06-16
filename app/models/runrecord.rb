class Runrecord < ActiveRecord::Base
  belongs_to :user

  def pace
    pace_by_second = runtime_to_seconds / self.distance
    # second_to_minute(pace_by_second) # 一旦コメント化
    pace_by_second
  end

  def runtime_to_seconds
    runtime_second = 0
    self.run_time.split(":").each_with_index do |i, idx|
      runtime_second += i.to_i * ( 60 ** ( 2 - idx ) )
    end
    runtime_second
  end

  def started_month
    self.runned_at.year.to_s + "%02d" % self.runned_at.month.to_s
  end

  def self.distance_summary_per_month(user)
    self.where(user_id: user.id).group_by(&:started_month).map do |date, records|
      { date: date, total_distance: records.sum { |r| r.distance } }
    end
  end

  def self.save_logs(logs)
    ActiveRecord::Base.transaction do
      logs.each do |log|
        unless Runrecord.exists?(runned_at: log[:started_at])
          Runrecord.create(runned_at: log[:started_at],
                           distance: log[:distance],
                           run_time: log[:run_time])
        end
      end
    end
  end
  # 一旦コメント化。グラフ化する際に数値でないとうまくグラフにならない
  # ようなので、いつか使う時が来たら有効化する。
  # def second_to_minute(pace)
  #   q, r = pace.divmod(60)
  #   sprintf("%02d:%02d", q, r)
  # end
end
