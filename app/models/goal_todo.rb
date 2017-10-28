class GoalTodo < ApplicationRecord
  belongs_to :goal
  belongs_to :todo
end
