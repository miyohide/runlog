require "test_helper"

class RunlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @runlog = runlogs(:one)
  end

  test "should get index" do
    get runlogs_url, as: :json
    assert_response :success
  end

  test "should create runlog" do
    assert_difference("Runlog.count") do
      post runlogs_url, params: { runlog: { aerobic_te: @runlog.aerobic_te, average_contact_time: @runlog.average_contact_time, average_gct_balance: @runlog.average_gct_balance, average_heart_beat: @runlog.average_heart_beat, average_pace: @runlog.average_pace, average_pitch: @runlog.average_pitch, average_power: @runlog.average_power, average_stalk_rate: @runlog.average_stalk_rate, average_stride_length: @runlog.average_stride_length, average_swolf: @runlog.average_swolf, average_vertical: @runlog.average_vertical, average_vertical_ratio: @runlog.average_vertical_ratio, best_lap_time: @runlog.best_lap_time, decompression: @runlog.decompression, distance: @runlog.distance, dive_time: @runlog.dive_time, elapsed_time: @runlog.elapsed_time, flow: @runlog.flow, grid: @runlog.grid, high_pace: @runlog.high_pace, high_pitch: @runlog.high_pitch, highest_temp: @runlog.highest_temp, kcal: @runlog.kcal, lap_count: @runlog.lap_count, lift: @runlog.lift, lowest_temp: @runlog.lowest_temp, max_heart_beat: @runlog.max_heart_beat, max_power: @runlog.max_power, maximum_altitude: @runlog.maximum_altitude, minimum_altitude: @runlog.minimum_altitude, number_of_reps: @runlog.number_of_reps, place: @runlog.place, running_date: @runlog.running_date, start_time: @runlog.start_time, surface_rest: @runlog.surface_rest, time: @runlog.time, total: @runlog.total, total_descent: @runlog.total_descent, travel_time: @runlog.travel_time } }, as: :json
    end

    assert_response :created
  end

  test "should show runlog" do
    get runlog_url(@runlog), as: :json
    assert_response :success
  end

  test "should update runlog" do
    patch runlog_url(@runlog), params: { runlog: { aerobic_te: @runlog.aerobic_te, average_contact_time: @runlog.average_contact_time, average_gct_balance: @runlog.average_gct_balance, average_heart_beat: @runlog.average_heart_beat, average_pace: @runlog.average_pace, average_pitch: @runlog.average_pitch, average_power: @runlog.average_power, average_stalk_rate: @runlog.average_stalk_rate, average_stride_length: @runlog.average_stride_length, average_swolf: @runlog.average_swolf, average_vertical: @runlog.average_vertical, average_vertical_ratio: @runlog.average_vertical_ratio, best_lap_time: @runlog.best_lap_time, decompression: @runlog.decompression, distance: @runlog.distance, dive_time: @runlog.dive_time, elapsed_time: @runlog.elapsed_time, flow: @runlog.flow, grid: @runlog.grid, high_pace: @runlog.high_pace, high_pitch: @runlog.high_pitch, highest_temp: @runlog.highest_temp, kcal: @runlog.kcal, lap_count: @runlog.lap_count, lift: @runlog.lift, lowest_temp: @runlog.lowest_temp, max_heart_beat: @runlog.max_heart_beat, max_power: @runlog.max_power, maximum_altitude: @runlog.maximum_altitude, minimum_altitude: @runlog.minimum_altitude, number_of_reps: @runlog.number_of_reps, place: @runlog.place, running_date: @runlog.running_date, start_time: @runlog.start_time, surface_rest: @runlog.surface_rest, time: @runlog.time, total: @runlog.total, total_descent: @runlog.total_descent, travel_time: @runlog.travel_time } }, as: :json
    assert_response :success
  end

  test "should destroy runlog" do
    assert_difference("Runlog.count", -1) do
      delete runlog_url(@runlog), as: :json
    end

    assert_response :no_content
  end
end
