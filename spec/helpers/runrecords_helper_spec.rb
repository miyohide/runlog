require 'rails_helper'

RSpec.describe RunrecordsHelper, type: :helper do
  describe ".distance_per_month_table" do
    let!(:user) { FactoryGirl.create(:has_runrecord_authority) }
    
    let!(:record_1503_01) { Runrecord.create(runned_at: Time.new(2015, 3, 12),
                                             distance: 10.4,
                                             user_id: user.id) }
    let!(:record_1503_02) { Runrecord.create(runned_at: Time.new(2015, 3, 22),
                                             distance:  5.4,
                                             user_id: user.id) }
    let!(:record_1503_03) { Runrecord.create(runned_at: Time.new(2015, 3, 22),
                                             distance:  5.4,
                                             user_id: user.id) }
    let!(:record_1504_01) { Runrecord.create(runned_at: Time.new(2015, 4, 22),
                                             distance:  5.4,
                                             user_id: user.id) }

    it "return HTML table" do
      expect(helper.distance_per_month_table(user)).to eq("<table><tbody><tr><td>201503</td><td>21.20</td></tr><tr><td>201504</td><td>5.40</td></tr></tbody></table>")
    end

  end
end
