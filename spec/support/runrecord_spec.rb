RSpec.shared_examples "Runrecord examples" do
  context "登録した人" do
    include_context "Runrecord"
    it { should permit(user, Runrecord.new(user_id: user.id)) }
  end

  context "登録した人以外" do
    include_context "Runrecord"
    it { should_not permit(user, Runrecord.new) }
  end
end
