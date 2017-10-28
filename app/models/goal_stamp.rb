class GoalStamp < ApplicationRecord
  belongs_to :goal
  belongs_to :stamp
  belongs_to :user
end
