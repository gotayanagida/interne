class ReportStamp < ApplicationRecord
  belongs_to :report
  belongs_to :stamp
  belongs_to :user
end
