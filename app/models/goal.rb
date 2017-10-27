class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :notice
end
