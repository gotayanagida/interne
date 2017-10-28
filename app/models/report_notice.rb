class ReportNotice < ApplicationRecord
  belongs_to :report
  belongs_to :notice
end
