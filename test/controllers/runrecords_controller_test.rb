require "test_helper"

class RunrecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @runrecord = runrecords(:default)
  end

  test "should get index" do
    get runrecords_url
    assert_response :success
  end

  test "should get new" do
    get new_runrecord_url
    assert_response :success
  end

  test "should create runrecord" do
    assert_difference('Runrecord.count') do
      post runrecords_url, params: { runrecord: { distance: @runrecord.distance, runtime: @runrecord.runtime, starttime: @runrecord.starttime } }
    end

    assert_redirected_to runrecord_url(Runrecord.last)
  end

  test "should show runrecord" do
    get runrecord_url(@runrecord)
    assert_response :success
  end

  test "should get edit" do
    get edit_runrecord_url(@runrecord)
    assert_response :success
  end

  test "should update runrecord" do
    patch runrecord_url(@runrecord), params: { runrecord: { distance: @runrecord.distance, runtime: @runrecord.runtime, starttime: @runrecord.starttime } }
    assert_redirected_to runrecord_url(@runrecord)
  end

  test "should destroy runrecord" do
    assert_difference('Runrecord.count', -1) do
      delete runrecord_url(@runrecord)
    end

    assert_redirected_to runrecords_url
  end
end
