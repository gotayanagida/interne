class Notice < ApplicationRecord
  has_many :notice_users
  has_many :users, through: :notice_users
  has_many :notice_companies
  has_many :companies, through: :notice_companies
  belongs_to :report
  belongs_to :task
  belongs_to :goal
end
