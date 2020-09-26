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
end
