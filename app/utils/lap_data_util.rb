require 'csv'

class LapDataUtil
  def self.CSV2LapData(contents)
    rval = []
    CSV.parse(contents, headers: true).each do |row|
      rval << {distance: row[3].to_f, elapsedtime: TimeStr2Seconds(row[1])}
    end
    rval
  end

  def self.TimeStr2Seconds(str)
    str.split(/:/).map(&:to_i).inject { |x, y| x * 60 + y }
  end
end
