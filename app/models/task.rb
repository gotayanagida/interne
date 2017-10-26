class Task < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :schedules, through: :task_schedules
  has_many :task_schedules
end
