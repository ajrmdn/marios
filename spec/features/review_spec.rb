require 'rails_helper'

describe "the add review process" do
  it "adds a review to a product" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Add a product'
    fill_in 'Name', :with => 'apple sauce'
    fill_in 'Cost', :with => '10.00'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    click_link 'apple sauce'
    click_link 'Add a review'
    fill_in 'Author', :with => 'JoeShmoe'
    fill_in 'Content body', :with => 'Love this stuff!'
    fill_in 'Rating', :with => '5'
    click_on 'commit'
    expect(page).to have_content 'JoeShmoe'
    expect(page).to have_content 'Love this stuff!'
    expect(page).to have_content '5/5'
  end
end

describe "the edit review process" do
  it "edit a review to a product" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Add a product'
    fill_in 'Name', :with => 'apple sauce'
    fill_in 'Cost', :with => '10.00'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    click_link 'apple sauce'
    click_link 'Add a review'
    fill_in 'Author', :with => 'JoeShmoe'
    fill_in 'Content body', :with => 'Love this stuff!'
    fill_in 'Rating', :with => '5'
    click_on 'commit'
    click_link 'Edit review'
    fill_in 'Author', :with => 'Hank'
    fill_in 'Rating', :with => '1'
    click_on 'commit'
    expect(page).to have_content 'Hank'
    expect(page).to have_content '1/5'
  end
end

describe "the delete review process" do
  it "delete a review to a product" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Add a product'
    fill_in 'Name', :with => 'apple sauce'
    fill_in 'Cost', :with => '10.00'
    fill_in 'Country of origin', :with => 'American'
    click_on 'Create Product'
    click_link 'apple sauce'
    click_link 'Add a review'
    fill_in 'Author', :with => 'JoeShmoe'
    fill_in 'Content body', :with => 'Love this stuff!'
    fill_in 'Rating', :with => '5'
    click_on 'commit'
    click_link 'Edit review'
    click_link 'Delete review'
    expect(page).to_not have_content 'JoeShmoe'
  end
end
