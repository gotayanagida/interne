class NoticeCompany < ApplicationRecord
  belongs_to :notice
  belongs_to :company
end
