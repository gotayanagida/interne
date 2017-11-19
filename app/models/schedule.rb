class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :report, required: false
  has_many :task_schedules
  has_many :tasks, through: :task_schedules
  has_many :schedule_todos
  has_many :todos, through: :schedule_todos

  def simple_work_started_at
    work_started_at.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[work_started_at.wday]}曜日 %-H:%M~")
  end
end
