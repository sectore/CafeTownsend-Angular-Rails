require 'faker'

FactoryGirl.define do
  fake_password = Faker::Lorem.words(5)
  factory :user do
    name { Faker::Name.first_name }
    password fake_password
    password_confirmation fake_password
  end
end