FactoryGirl.define do
  factory :flight do
    association :from_airport, factory: :airport
    association :to_airport, factory: :airport
    date Time.now + 24 * 3600
    time "12:00 pm"
  end
end
