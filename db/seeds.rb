require 'faker'

Product.destroy_all
Review.destroy_all

50.times do |index|
 Product.create!(name: Faker::Food.product, cost: Faker::Number.between(from: 1, to: 100))
end

5.times do |i|
 Review.create!(author: Faker::TvShows::.character, content_body: Faker::TvShows::,rating: Faker::Number.within(range: 1..5))
end


p "Created #{Product.count} products and #{Review.count} reviews"
