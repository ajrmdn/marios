require 'rails_helper'

describe "the add product process" do

  it "adds a new product" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Add a product'
    fill_in 'Name', :with => 'apple sauce'
    fill_in 'Cost', :with => '10.00'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'apple sauce'
    expect(page).to have_content '$10.00'
    expect(page).to have_content 'American'
  end
end

describe "the edit a product process" do
  it "edits a pre-existing product" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Add a product'
    fill_in 'Name', :with => 'apple sauce'
    fill_in 'Cost', :with => '10.00'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    click_link 'apple sauce'
    click_on 'Edit product'
    fill_in 'Cost', :with => '11.00'
    click_on 'commit'
    expect(page).to have_content 'apple sauce'
    expect(page).to have_content '$11.00'
    expect(page).to have_content 'American'
  end
end

describe "the delete a product process" do
  it "deletes a pre-existing product" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Add a product'
    fill_in 'Name', :with => 'apple sauce'
    fill_in 'Cost', :with => '10.00'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    click_link 'apple sauce'
    click_link 'Edit product'
    click_link 'Delete product'
    expect(page).to_not have_content 'apple sauce'
  end
end
