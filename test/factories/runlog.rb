FactoryBot.define do
  factory :runlog do
    run_date { Time.now }
    distance { 10.0 }
    total_time_hours { 1 }
    total_time_minutes { 2 }
    total_time_seconds { 3 }

    trait :with_shoe_and_course do
      association :shoe
      association :course
    end
  end
end
