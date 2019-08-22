require 'rails_helper'

FactoryBot.define do
   factory :user do
   email {"abdellah@gmail.com"}
   password {"password"}
   admin {true}
   end
end
