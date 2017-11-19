class ScheduleTodo < ApplicationRecord
  belongs_to :schedule
  belongs_to :todo
end
