FactoryGirl.define do
  factory :booking do
    association :flight, factory: :flight
    price 1200
    flight_id 6
    user_id 23
  end
end
