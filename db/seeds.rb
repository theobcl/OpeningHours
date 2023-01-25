require 'faker'

if Shop.any?
  puts "Destroy existing shops"
  Shop.destroy_all
  puts "Shops destruction done"
end

puts "Create 10 shops"

12.times do
  Shop.create(name: Faker::Restaurant.name)
end

puts "Shops creation done"
