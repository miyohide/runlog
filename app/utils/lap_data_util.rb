require 'csv'

class LapDataUtil
  def self.CSV2LapData(contents)
    rval = []
    CSV.parse(contents, headers: true).each do |row|
      next if row['ラップ数'] == '概要'
      rval << {distance: row['距離'].to_f, elapsedtime: TimeStr2Seconds(row['タイム'])}
    end
    rval
  end

  def self.TimeStr2Seconds(str)
    str.split(/:/).map(&:to_i).inject { |x, y| x * 60 + y }
  end
end
