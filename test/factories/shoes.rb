FactoryBot.define do
  factory :shoe do
    name { Gimei.name.kanji }
  end
end
