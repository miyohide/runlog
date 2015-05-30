FactoryGirl.define do
  factory :administrator, class: User do
    before(:create) { create(:admin_role) }

    admin_ability true
    email    { Forgery(:email).address }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end

  factory :has_runrecord_authority, class: User do
    before(:create) { create(:runrecord_role) }

    admin_ability false
    email    { Forgery(:email).address }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end

  # factory :has_role_authority, class: User do
  #   before(:create)  { create(:role_role) }
  #   admin_ability false
  #   email    { Forgery(:email).address }
  #   password { "hogehoge" }
  #   password_confirmation { "hogehoge" }
  # end
  #
  # factory :has_only_view_authority, class: User do
  #   before(:create)  { create(:only_view_role) }
  #   admin_ability false
  #   email    { Forgery(:email).address }
  #   password { "hogehoge" }
  #   password_confirmation { "hogehoge" }
  # end
end
