require "test_helper"

class RunrecordTest < ActiveSupport::TestCase
  test "適切な値を入れたとき、Runrecordが作られる" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 10.0, runtime: 600)
    assert runrecord.valid?
  end

  test "距離が負の数の時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, distance: -1.0, runtime: 600)
    assert_not runrecord.valid?
  end

  test "距離が0の時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 0.0, runtime: 600)
    assert_not runrecord.valid?
  end

  test "距離が指定されていない時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, runtime: 600)
    assert_not runrecord.valid?
  end

  test "時間が負の数の時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 10.0, runtime: -1)
    assert_not runrecord.valid?
  end

  test "時間が0の時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 10.0, runtime: 0)
    assert_not runrecord.valid?
  end

  test "時間が整数でない時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 10.0, runtime: 1.8)
    assert_not runrecord.valid?
  end

  test "時間が指定されていない時、Runrecordは妥当ではない" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 10.0)
    assert_not runrecord.valid?
  end
end
