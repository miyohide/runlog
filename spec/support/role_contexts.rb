shared_context "管理者" do
  let(:user) { FactoryGirl.create(:administrator) }
end

shared_context "Runrecord" do
  let(:user) { FactoryGirl.create(:has_runrecord_authority) }
end

