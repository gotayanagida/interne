class Report < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  belongs_to :company
end
