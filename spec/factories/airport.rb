FactoryGirl.define do
  factory :airport do
    sequence(:name) { |n| "Murtala International, Lagos #{n}" }
    city "Lagos"
  end
end
