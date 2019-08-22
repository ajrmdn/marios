require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it("titleizes the name of a product") do
    product = Product.create({name: "apple sauce", cost: 10.00, country_of_origin: "America"})
    product.save!
    expect(product.name).to(eq("apple sauce"))
  end

  it("should create a product") do
    product = Product.create({name: "apple sauce", cost: 10.00, country_of_origin: "America"})
    product.save!
    expect(Product.all).to(eq([product]))
  end

  it("should edit a product") do
    product = Product.create({name: "apple sauce", cost: 10.00, country_of_origin: "America"})
    product.save!
    product.update!({name: "potato"})
    expect(product.name).to(eq("potato"))
  end
  
  it("should delete a product") do
    product = Product.create({name: "apple sauce", cost: 10.00, country_of_origin: "America"})
    product = Product.create({name: "potato", cost: 10.00, country_of_origin: "America"})
    product_one.destroy
    expect(Product.all).to(eq([product_two]))
  end
end
