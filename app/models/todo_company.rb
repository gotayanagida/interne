class TodoCompany < ApplicationRecord
  belongs_to :todo
  belongs_to :company
end
