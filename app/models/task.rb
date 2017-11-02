class Task < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :task_schedules
  has_many :schedules, through: :task_schedules
  has_many :task_notices
  has_many :notices, through: :task_notices

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
