class Company < ApplicationRecord
  has_many :tasks
  has_many :schedules
  has_many :goals
  has_many :reports
  has_many :attendances
  has_many :notice_companies
  has_many :notices, through: :notice_companies
  has_many :todo_companies
  has_many :todos, through: :todo_companies
  has_many :company_users
  has_many :users, through: :company_users

end
