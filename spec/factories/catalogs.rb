FactoryBot.define do
  factory :catalog do
    title {"aaaaa"}
    location {"nooooo"}
    category {FactoryBot.create(:category)}
  end
end
