require 'faker'

puts "Create 10 shops"

10.times do
  Shop.create(name: Faker::Restaurant.name)
end

puts "Shops creation done"
