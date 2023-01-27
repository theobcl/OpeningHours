require 'faker'

if Shop.any?
  puts "Destroy existing shops"
  Shop.destroy_all
  puts "Shops destruction done"
end

puts "Create 10 shops"

1.times do
  shop = Shop.create(name: Faker::Restaurant.name)
  OpeningHour.create(shop: shop, day: :monday, is_closed: false, start_at: "09:00", end_at: "12:00")
  OpeningHour.create(shop: shop, day: :monday, is_closed: true, start_at: "09:00", end_at: "12:00")
  OpeningHour.create(shop: shop, day: :monday, is_closed: false, start_at: "11:00", end_at: "19:00")
  OpeningHour.create(shop: shop, day: :monday, is_closed: false, start_at: "13:00", end_at: "19:00")
end

puts "Shops creation done"
