require 'rails_helper'

describe RunrecordPolicy do

  subject { described_class }

  permissions :index? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end

  permissions :show? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end

  permissions :new? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end

  permissions :create? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end

  permissions :update? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end

  permissions :edit? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end

  permissions :destroy? do
    context "登録した人" do
      include_context "Runrecord"
      it { should permit(user, Runrecord.new(user_id: user.id)) }
    end

    context "登録した人以外" do
      include_context "Runrecord"
      it { should_not permit(user, Runrecord.new) }
    end
  end
end
