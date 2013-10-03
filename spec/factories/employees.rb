require 'faker'

FactoryGirl.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    start_date { Date.today-rand(10_000) }
  end
end