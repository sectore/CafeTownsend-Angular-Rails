class Employee < ActiveRecord::Base
  validates_presence_of :first_name, on: :create
  validates_presence_of :last_name, on: :create
  validates_presence_of :email, on: :create
  validates_presence_of :start_date, on: :create
end
