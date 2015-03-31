require 'rails_helper'

RSpec.describe GarminLogs, type: :model do
  describe "#csv_parse" do
    let(:garmin_log) { GarminLog.new }
    before do
      data = <<-EOF
アクティビティ &#21517;&#21069; miyohide
 
 お気に入り,アクティビティ名,アクティビティ タイプ,コース,スタート,タイム,距離,高度上昇量,平均スピード(平均ペース),最高スピード(ベストペース),平均心拍,最高心拍,カロリー,合計ストローク数,平均ストローク数,最小ストローク数,平均SWOLF,最高SWOLF,トレーニング効果,
 false,タイトルなし,ランニング,--,"土, 2014 10 11 9:12 午前",3:15:05,30.03,144,6:30,3:56,--,--,"1,686",--,--,--,--,--,--,
 false,タイトルなし,ランニング,--,"日, 2014 10 5 2:00 午後",13:26,3.02,11,4:27,3:42,--,--,173,--,--,--,--,--,--,
      EOF
      allow(garmin_log).to receive(:read).and_return(data)

      @parse_result = garmin_log.parse_csv
    end

    it "get distance, time, stat date" do
      expect(@parse_result[0][:distance]).to eq(30.03)
      expect(@parse_result[0][:run_time]).to eq("3:15:05")
      expect(@parse_result[0][:started_at]).to eq("2014/10/11 09:12:00")

      expect(@parse_result[1][:distance]).to eq(3.02)
      expect(@parse_result[1][:run_time]).to eq("0:13:26")
      expect(@parse_result[1][:started_at]).to eq("2014/10/05 14:00:00")

    end
  end
end
