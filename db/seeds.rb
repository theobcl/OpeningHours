require 'faker'

if Shop.any?
  puts "Destroy existing shops"
  Shop.destroy_all
  puts "Shops destruction done"
end

puts "Create 10 shops"

days = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

12.times do
  shop = Shop.create(name: Faker::Company.name)

  days.each do |day|
    if rand(0..2) == 0
      shop.opening_hours.create(day: day, is_closed: true)
    elsif rand(0..2) == 1
      shop.opening_hours.create(day: day, start_at: "9:00", end_at: "13:00")
      shop.opening_hours.create(day: day, start_at: "15:00", end_at: "19:00")
    else
      shop.opening_hours.create(day: day, start_at: "9:00", end_at: "19:00")
    end
  end
end

puts "Shops creation done"
