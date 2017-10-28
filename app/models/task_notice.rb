class TaskNotice < ApplicationRecord
  belongs_to :task
  belongs_to :notice
end
