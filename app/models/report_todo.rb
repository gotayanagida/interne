class ReportTodo < ApplicationRecord
  belongs_to :report
  belongs_to :todo
end
