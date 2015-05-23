shared_context "管理者" do
  let(:user) { FactoryGirl.create(:administrator) }
end

shared_context "User" do
  let(:user) { FactoryGirl.create(:has_user_authority) }
end

shared_context "Role" do
  let(:user) { FactoryGirl.create(:has_role_authority) }
end

