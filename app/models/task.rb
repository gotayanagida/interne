class Task < ApplicationRecord
  belongs_to :user
  has_many :schedules, through: :task_schedules
  has_many :task_schedules
end
