require 'rails_helper'

describe RunrecordPolicy do

  subject { described_class }

  permissions :index? do
    it_behaves_like "Runrecord examples"
  end

  permissions :show? do
    it_behaves_like "Runrecord examples"
  end

  permissions :new? do
    it_behaves_like "Runrecord examples"
  end

  permissions :create? do
    it_behaves_like "Runrecord examples"
  end

  permissions :update? do
    it_behaves_like "Runrecord examples"
  end

  permissions :edit? do
    it_behaves_like "Runrecord examples"
  end

  permissions :destroy? do
    it_behaves_like "Runrecord examples"
  end
end
