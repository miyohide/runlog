require 'csv'

class LapDataUtil
  def self.CSV2LapData(contents)
    rval = []
    CSV.parse(contents, headers: true).each do |row|
      # TODO rowの引数が日本語の場合、うまく動かない問題を対応する
      # テストコードではうまく動くが、CSVを読み込ませるとrowの引数が
      # 日本語ではうまく動かない
      rval << {distance: row[3].to_f, elapsedtime: TimeStr2Seconds(row[1])}
    end
    rval
  end

  def self.TimeStr2Seconds(str)
    str.split(/:/).map(&:to_i).inject { |x, y| x * 60 + y }
  end
end
