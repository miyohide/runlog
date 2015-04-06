class GarminLog < ActiveRecord::Base
  tori :csv_file

  after_save do
    csv_file.write if csv_file.from?
  end

  after_destroy do
    csv_file.delete
  end

  def parse_csv
    parse_result = []
    CSV.parse(self.csv_file.read) do |row|
      next if row[0].strip != "true" && row[0].strip != "false"
      parse_result << { distance:   row[6].to_f,
                        run_time:   time_normalization(row[5]),
                        started_at: start_time_convert(row[4]) }
    end
    parse_result
  end

  private
  def time_normalization(str_time)
    if str_time.split(":").size == 2
      "0:" + str_time
    else
      str_time
    end
  end

  def start_time_convert(str_start_time)
    time_data_list = str_start_time.split(",")[1].strip.split

    hour_data = time_data_list[3].split(":")[0].to_i
    hour_data += 12 if time_data_list[4] == "午後"
    minute_data = time_data_list[3].split(":")[1]

    Time.mktime(time_data_list[0], time_data_list[1], time_data_list[2],
                hour_data, minute_data)
  end
end

