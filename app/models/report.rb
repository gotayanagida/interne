class Report < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  belongs_to :company
  has_many :report_notices
  has_many :notices, through: :report_notices
end
