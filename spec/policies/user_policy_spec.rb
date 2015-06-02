require 'rails_helper'

describe UserPolicy do

  subject { described_class }

  permissions :index? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end
  end

  permissions :show? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end
  end

  permissions :new? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end
  end

  permissions :create? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end
  end

  permissions :update? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end

    context "自分自身のデータは編集できる" do
      include_context "Runrecord"
      it { should permit(user, user) }
    end

    context "他人のデータは編集できない" do
      include_context "Runrecord"
      it { should_not permit(user, User.new) }
    end
  end

  permissions :edit? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end
  end

  permissions :destroy? do
    context "管理者" do
      include_context "管理者"
      it { should permit(user, User.new) }
    end
  end
end
