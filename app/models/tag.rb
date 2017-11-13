class Tag < ApplicationRecord
  has_many :task_tags
  has_many :tasks, through: :task_tags
  belongs_to :company
end
