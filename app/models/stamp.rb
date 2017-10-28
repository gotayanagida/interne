class Stamp < ApplicationRecord
  has_many :report_stamps
  has_many :reports, through: :report_stamps
  has_many :goal_stamps
  has_many :goals, through: :goal_stamps
end
