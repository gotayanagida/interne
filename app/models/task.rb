class Task < ApplicationRecord
  # belongs_to :user, optional: true
  belongs_to :company
  has_many :task_schedules
  has_many :schedules, through: :task_schedules
  has_many :task_notices
  has_many :notices, through: :task_notices
  has_many :task_labels
  has_many :labels, through: :task_labels
  has_many :task_users
  has_many :users, through: :task_users

  def self.associate_task(params:, task:)
    user_id = params[:task][:task_users][:user_id]
    unless user_id.blank?
      user = User.find(user_id)
      user.tasks << task
    end
    schedule_id = params[:task][:task_schedules][:schedule_id]
    unless schedule_id.blank?
      schedule = Schedule.find(schedule_id)
      schedule.tasks << task
    end
    label_id = params[:task][:task_labels][:label_id]
    unless label_id.blank?
      label = Label.find(label_id)
      label.tasks << task
    end
  end

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
