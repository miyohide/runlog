require "rails_helper"

RSpec.describe Runrecord, type: :model do
  describe "#pace" do
    context "more than one hour" do
      let(:record) { Runrecord.new(distance: 10.000, run_time: "1:00:00") }

      it "pace is run_time/distance" do
        expect(record.pace).to eq(360.0)
      end
    end

    context "hour" do
      let(:record) { Runrecord.new(distance: 10.000, run_time: "0:45:38") }

      it "pace is run_time/distance" do
        expect(record.pace).to eq(273.8)
      end
    end
  end

  describe "#runtime_to_seconds" do
    context "more than one hour" do
      let(:record) { Runrecord.new(run_time: "1:10:20") }

      it "calc second is correct" do
        expect(record.runtime_to_seconds).to eq(4220)
      end
    end

    context "less than one hour" do
      let(:record) { Runrecord.new(run_time: "0:50:12") }

      it "calc second is correct" do
        expect(record.runtime_to_seconds).to eq(3012)
      end
    end

    context "less than one minute" do
      let(:record) { Runrecord.new(run_time: "0:00:48") }

      it "calc second is correct" do
        expect(record.runtime_to_seconds).to eq(48)
      end
    end
  end

  describe "#save_logs" do
    context "don't have runrecord" do
      it "create record" do
        expect {
          Runrecord.save_logs([{started_at: Time.mktime(2015, 4, 10, 11, 12),
                                distance: 10.2,
                                run_time: "1:01:15"}])
        }.to change{ Runrecord.count }.from(0).to(1)
      end
    end
  end

  describe ".started_month" do
    let(:record) { Runrecord.new(runned_at: Time.new(2015, 3, 12)) }
    it "return year + month" do
      expect(record.started_month).to eq("201503")
    end
  end

  describe "#distance_summary_per_month" do
    let!(:user) { FactoryGirl.create(:has_runrecord_authority) }
    let!(:record_1503_01) { Runrecord.create(runned_at: Time.new(2015, 3, 12),
                                             distance: 10.4,
                                             user_id: user.id) }
    let!(:record_1503_02) { Runrecord.create(runned_at: Time.new(2015, 3, 22),
                                             distance:  5.4,
                                             user_id: user.id) }
    let!(:record_1503_03) { Runrecord.create(runned_at: Time.new(2015, 3, 22),
                                             distance:  5.4,
                                             user_id: user.id + 1) }
    let!(:record_1504_01) { Runrecord.create(runned_at: Time.new(2015, 4, 22),
                                             distance:  5.4,
                                             user_id: user.id) }

    subject(:distances) { Runrecord.distance_summary_per_month(user) }

    it "return Array that has Hash element" do
      expect(distances).to be_a(Array)
      expect(distances.first).to be_a(Hash)
    end

    it "element is correct" do
      expect(distances).to include({ date: "201503", total_distance: 15.8 })
      expect(distances).to include({ date: "201504", total_distance: 5.4 })
    end
  end
end
