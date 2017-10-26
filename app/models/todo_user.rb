class TodoUser < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :todo
end
