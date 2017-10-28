class Notice < ApplicationRecord
  has_many :notice_users
  has_many :users, through: :notice_users
  has_many :notice_companies
  has_many :companies, through: :notice_companies
  has_many :report_notices
  has_many :reports, through: :report_notices
  has_many :task_notices
  has_many :tasks, through: :task_notices
  has_many :goal_notices
  has_many :goals, through: :goal_notices
end
