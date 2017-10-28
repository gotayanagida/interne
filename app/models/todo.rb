class Todo < ApplicationRecord
  has_many :todo_users
  has_many :users, through: :todo_users
  has_many :todo_companies
  has_many :companies, through: :todo_companies
  has_many :report_todos
  has_many :reports, through: :report_todos
  has_many :goal_todos
  has_many :goals, through: :goal_todos
end
