require "test_helper"

class RunrecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @runrecord = runrecords(:default)
  end

  test "indexページにアクセスできること" do
    get runrecords_url
    assert_response :success
  end

  test "newページにアクセスできること" do
    get new_runrecord_url
    assert_response :success
  end

  test "新しいRunrecordが作成されること" do
    assert_difference('Runrecord.count') do
      post runrecords_url, params: { runrecord: { distance: @runrecord.distance, runtime: @runrecord.runtime, starttime: @runrecord.starttime } }
    end

    assert_redirected_to runrecord_url(Runrecord.last)
  end

  test "個別のRunrecordが参照できること" do
    get runrecord_url(@runrecord)
    assert_response :success
  end

  test "editページにアクセスできること" do
    get edit_runrecord_url(@runrecord)
    assert_response :success
  end

  test "Runrecordを更新できること" do
    patch runrecord_url(@runrecord), params: { runrecord: { distance: @runrecord.distance, runtime: @runrecord.runtime, starttime: @runrecord.starttime } }
    assert_redirected_to runrecord_url(@runrecord)
  end

  test "Runrecordを削除できること" do
    assert_difference('Runrecord.count', -1) do
      delete runrecord_url(@runrecord)
    end

    assert_redirected_to runrecords_url
  end
end
