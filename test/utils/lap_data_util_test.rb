require 'test_helper'

class RunlogTest < ActiveSupport::TestCase
  test "return a array includes distance and time" do
    rval = LapDataUtil.CSV2LapData(
      [
        %Q("1","3:03.4","3:03.4","0.50","6:07","171","184","--","10","180","0.91","31","5:29","183","3:01","6:02"),
        %Q("2","2:40.0","5:43.4","0.50","5:20","179","187","6","--","183","1.02","29","5:12","187","2:40","5:20")
      ]
    )
    assert_equal 0.50, rval[0][:distance]
    assert_equal 183, rval[0][:elapsedtime]
    assert_equal 0.50, rval[1][:distance]
    assert_equal 160, rval[1][:elapsedtime]
  end
end
