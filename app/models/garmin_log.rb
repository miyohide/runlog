class GarminLog < ActiveRecord::Base
  tori :csv_file

  after_save do
    csv_file.write if csv_file.from?
  end

  after_save :parse_csv

  after_destroy do
    csv_file.delete
  end

  def parse_csv
    parse_result = []
    CSV.parse(self.csv_file.read) do |row|
      next if row[0].strip != "true" && row[0].strip != "false"
      parse_result << { distance: row[6].to_f , run_time: row[5] }
    end
    parse_result
  end
end

