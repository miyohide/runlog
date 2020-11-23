require 'test_helper'

class RunlogsHelperTest < ActionView::TestCase
  test "calculate total_time_hours_value" do
    assert_equal 1, total_time_hours_value(3600)
  end

  test "calculate total_time_minutes_value" do
    assert_equal 1, total_time_minutes_value(60)
  end

  test "calculate total_time_seconds_value" do
    assert_equal 30, total_time_seconds_value(30)
  end

  test "シューズが登録されている場合、shoe_nameは名前を返す" do
    runlog = FactoryBot.create(:runlog, :with_shoe_and_course)
    assert_equal runlog.shoe.name, shoe_name(runlog)
  end

  test "seconds2mmssで秒から分:秒の文字列に変換すること" do
    assert_equal "00:12", seconds2mmss(12)
    assert_equal "01:12", seconds2mmss(72)
    assert_equal "02:31", seconds2mmss(151)
  end
end
