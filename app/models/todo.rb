class Todo < ApplicationRecord
  has_many :todo_users
  has_many :users, through: :todo_users
end
