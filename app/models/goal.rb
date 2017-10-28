class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :goal_notices
  has_many :notices, through: :goal_notices
  has_many :goal_todos
  has_many :todos, through: :goal_todos
end
