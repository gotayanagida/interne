class TaskSchedule < ApplicationRecord
  belongs_to :task
  belongs_to :schedule
end
