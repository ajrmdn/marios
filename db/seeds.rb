Product.destroy_all
50.times do |index|
 Product.create!(name: Faker::Food.product, cost: Faker::Number.between(from: 1, to: 100))
end

p "Created #{Product.count} products"
