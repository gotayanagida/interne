class Report < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  belongs_to :company
  has_many :notice
end
