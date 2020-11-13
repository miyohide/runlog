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

  test "when call import_lap_data, create RunlogDetail records" do
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
    runlog.import_lap_data(
      [{distance: 0.5, elapsedtime: 120}, {distance: 0.5, elapsedtime: 140}]
    )
    assert_equal 0.5, runlog.runlog_details.first.distance
    assert_equal 120, runlog.runlog_details.first.elapsedtime
    assert_equal 0.5, runlog.runlog_details.second.distance
    assert_equal 140, runlog.runlog_details.second.elapsedtime
  end
end
