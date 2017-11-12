class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :task_schedules
  has_many :tasks, through: :task_schedules

  def simple_work_started_at
    work_started_at.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[work_started_at.wday]}曜日 %-H:%M~")
  end
end
