# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Flight.delete_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'flights'")
airport_id = (1..13).to_a
times = ["8:00 am", "10:00 am", "12:00 pm", "2:00 pm", "4:00 pm", "6:00 pm", "9:00 pm"]
def set_airport(id)
  from_airport = id.sample
  to_airport = id.sample
  while from_airport == to_airport
    from_airport = id.sample
    to_airport = id.sample
  end
  return from_airport, to_airport
end
def set_flight(id, times)
  duration = (1..14).to_a.sample
  date = Time.at(Time.now  + 24 * 3600 * rand(11..15))
  airports = set_airport(id)
  {from_airport_id: airports[0], to_airport_id: airports[1], duration: duration, date: date, time: times.sample}
end
2000.times do
  Flight.create(set_flight(airport_id, times))
end