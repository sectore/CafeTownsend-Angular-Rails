# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user name:string password:string password_confirmation:string
User.create!(name: 'Luke', password: 'Skywalker', password_confirmation: 'Skywalker')

# employee first_name:string last_name:string email:string start_date:date
Employee.create!([
  {
    :first_name   => 'Sue',
    :last_name    => 'Hove',
    :email        => 'shove@cafetownsend.com',
    :start_date   => DateTime.new(2006,1,7)
  },
  {
    :first_name   => 'Matt',
    :last_name    => 'Boles',
    :email        => 'mboles@cafetownsend.com',
    :start_date   => DateTime.new(2006,2,17)
  },
  {
    :first_name   => 'Mike',
    :last_name    => 'Kollen',
    :email        => 'mkollen@cafetownsend.com',
    :start_date   => DateTime.new(2006,3,1)
  },
  {
    :first_name   => 'Jennifer',
    :last_name    => 'Jaegel',
    :email        => 'jjaegel@cafetownsend.com',
    :start_date   => DateTime.new(2006,4,1)
  }
])
