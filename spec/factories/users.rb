FactoryGirl.define do
  factory :administrator, class: User do
    role_id  { create(:admin_role).id }
    email    { Forgery(:email).address }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end

  factory :has_user_authority, class: User do
    role_id  { create(:user_role).id }
    email    { Forgery(:email).address }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end

  factory :has_role_authority, class: User do
    role_id  { create(:role_role).id }
    email    { Forgery(:email).address }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end

  factory :has_only_view_authority, class: User do
    role_id  { create(:only_view_role).id }
    email    { Forgery(:email).address }
    password { "hogehoge" }
    password_confirmation { "hogehoge" }
  end
end
