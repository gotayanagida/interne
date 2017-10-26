class Todo < ApplicationRecord
  has_many :todo_users
  has_many :users, through: :todo_users
  has_many :todo_companies
  has_many :companies, through: :todo_companies
end
