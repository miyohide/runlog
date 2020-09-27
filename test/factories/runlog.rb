FactoryBot.define do
  factory :runlog do
    run_date { Time.now }
    distance { 10.0 }
    total_time { 3663 }
  end
end
