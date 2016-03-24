# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def my_rand(integer)
  test = rand(integer)
  if test == 0
    my_rand(integer)
  else
    test
  end
end
airport_id = (1..13).to_a

def set_airport(id)
  from_airport = id.sample
  to_airport = id.sample
  set_airport(id) if from_airport == to_airport
  return from_airport, to_airport
end
def set_flight(id)
  duration = (1..17).to_a.sample
  date = Time.at(Time.now  + 24 * 3600 * my_rand(30))
  airports = set_airport(id)
  {from_airport_id: airports[0], to_airport_id: airports[1], duration: duration, date: date}
end
200.times do
  Flight.create(set_flight(airport_id))
end