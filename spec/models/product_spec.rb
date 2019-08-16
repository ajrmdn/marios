require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it("titleizes the name of an product") do
    product = Product.create({name: "apple sauce", cost: 10})
    expect(product.name()).to(eq("Apple Sauce"))
  end
end
