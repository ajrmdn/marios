require 'faker'

Product.destroy_all
Review.destroy_all

50.times do |index|
 product = Product.create!(name: Faker::Food.ingredient, cost: Faker::Number.between(from: 1, to: 100), country_of_origin: Faker::Address.country)

5.times do |i|
 product.reviews.create!(author: Faker::TvShows::NewGirl.character, content_body: Faker::TvShows::NewGirl.quote,rating: Faker::Number.within(range: 1..5))

 end
end


p "Created #{Product.count} products and #{Review.count} reviews"
