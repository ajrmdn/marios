require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_length_of(:content_body).is_at_least(50) }
  it { should validate_length_of(:content_body).is_at_most(250) }
  it { should validate_inclusion_of(:rating).in_range(1..5) }
  it("should create a review") do
    product = FactoryBot.create(:product)
    product.reviews.new(author: "Joe", content_body: "Love this stuff!", rating: 5)
    product.save
    expect(product.reviews[0].author).to(eq("Joe"))
  end
  
  it("should update a review") do
    product = FactoryBot.create(:product)
    product.reviews.new(author: "Joe", content_body: "Love this stuff!!", rating: 5)
    product.save
    product.reviews[0].update(author: "Hank")
    expect(product.reviews[0].author).to(eq("Hank"))
  end
end
