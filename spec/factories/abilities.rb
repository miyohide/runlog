FactoryGirl.define do
  factory :admin_ability, class: Ability do
    domain "admin"
    ability "admin"
  end

  factory :user_index, class: Ability do
    domain "user"
    ability "index"
  end

  factory :user_show, class: Ability do
    domain "user"
    ability "show"
  end

  factory :user_create, class: Ability do
    domain "user"
    ability "create"
  end

  factory :user_update, class: Ability do
    domain "user"
    ability "update"
  end

  factory :user_destroy, class: Ability do
    domain "user"
    ability "destroy"
  end

  factory :runrecord_index, class: Ability do
    domain "role"
    ability "index"
  end

  factory :runrecord_show, class: Ability do
    domain "role"
    ability "show"
  end

  factory :runrecord_create, class: Ability do
    domain "role"
    ability "create"
  end

  factory :runrecord_update, class: Ability do
    domain "role"
    ability "update"
  end

  factory :runrecord_destroy, class: Ability do
    domain "role"
    ability "destroy"
  end

  factory :role_index, class: Ability do
    domain "role"
    ability "index"
  end

  factory :role_show, class: Ability do
    domain "role"
    ability "show"
  end

  factory :role_create, class: Ability do
    domain "role"
    ability "create"
  end

  factory :role_update, class: Ability do
    domain "role"
    ability "update"
  end

  factory :role_destroy, class: Ability do
    domain "role"
    ability "destroy"
  end

end
