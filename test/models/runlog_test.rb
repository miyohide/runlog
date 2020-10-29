require 'test_helper'

class RunlogTest < ActiveSupport::TestCase
  test "calculate total_time" do
    shoe = FactoryBot.create(:shoe)
    course = FactoryBot.create(:course)
    runlog = Runlog.create(
      run_date: Time.now,
      distance: 1.0,
      total_time_hours: 1,
      total_time_minutes: 2,
      total_time_seconds: 3,
      shoe: shoe,
      course: course
    )
    assert_equal 3_723, runlog.total_time
  end
end
