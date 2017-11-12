class Label < ApplicationRecord
  belongs_to :company
  has_many :task_labels
  has_many :tasks, through: :task_labels
end
