require "test_helper"

class RunrecordTest < ActiveSupport::TestCase
  test "適切な値を入れたとき、Runrecordが作られる" do
    runrecord = Runrecord.new(starttime: Time.now, distance: 10.0, runtime: 600)
    assert runrecord.valid?
  end
end
