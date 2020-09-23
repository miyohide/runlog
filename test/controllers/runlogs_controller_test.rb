require 'test_helper'

class RunlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @runlog = runlogs(:one)
  end

  test "should get index" do
    get runlogs_url
    assert_response :success
  end

  test "should get new" do
    get new_runlog_url
    assert_response :success
  end

  test "should create runlog" do
    assert_difference('Runlog.count') do
      post runlogs_url, params: { runlog: { distance: @runlog.distance, run_date: @runlog.run_date } }
    end

    assert_redirected_to runlog_url(Runlog.last)
  end

  test "should show runlog" do
    get runlog_url(@runlog)
    assert_response :success
  end

  test "should get edit" do
    get edit_runlog_url(@runlog)
    assert_response :success
  end

  test "should update runlog" do
    patch runlog_url(@runlog), params: { runlog: { distance: @runlog.distance, run_date: @runlog.run_date } }
    assert_redirected_to runlog_url(@runlog)
  end

  test "should destroy runlog" do
    assert_difference('Runlog.count', -1) do
      delete runlog_url(@runlog)
    end

    assert_redirected_to runlogs_url
  end
end
