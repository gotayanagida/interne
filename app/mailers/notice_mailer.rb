class NoticeMailer < ApplicationMailer
  def send_day_before_to_staff(schedules, staff)
    @staff = staff
    @schedules = schedules
    mail to:      staff.email,
    subject: 'インターン生出社通知'
  end

  def send_day_before_to_intern(schedules, intern)
    @intern = intern
    @schedules = schedules
    mail to:      intern.email,
    subject: 'インターン生出社通知'
  end

  def seven_days_nothing_schedule(intern)
    @intern = intern
    mail to:      intern.email,
    subject: 'インターン生出社通知'
  end
end
