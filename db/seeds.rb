require 'faker'

if Shop.any?
  puts "Destroy existing shops"
  Shop.destroy_all
  puts "Shops destruction done"
end

puts "Create 10 shops"

12.times do
  shop = Shop.create(name: Faker::Restaurant.name)
  OpeningHour.create(shop: shop, day: 0, is_closed: false, start_at: "09:00", end_at: "12:00")
end

puts "Shops creation done"
