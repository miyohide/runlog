require 'test_helper'

class RunlogTest < ActiveSupport::TestCase
  test "return a array includes distance and time" do
    contents = <<EOS
"ラップ数","タイム","累積時間","距離","平均ペース","平均心拍数","最大心拍数","高度上昇","高度下降","平均ピッチ","平均歩幅","カロリー","最高ペース","最高ピッチ","移動時間","平均移動ペース"
"1","3:03.4","3:03.4","0.50","6:07","171","184","--","10","180","0.91","31","5:29","183","3:01","6:02"
"2","2:40.0","5:43.4","0.50","5:20","179","187","6","--","183","1.02","29","5:12","187","2:40","5:20"
EOS
    rval = LapDataUtil.CSV2LapData(contents)
    assert_equal 0.50, rval[0][:distance]
    assert_equal 183, rval[0][:elapsedtime]
    assert_equal 0.50, rval[1][:distance]
    assert_equal 160, rval[1][:elapsedtime]
  end

  test "time string to seconds" do
    assert_equal 183, LapDataUtil.TimeStr2Seconds("3:03.4")
  end
end
