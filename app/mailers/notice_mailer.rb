class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.send_day_before.subject
  #
  def send_day_before(schedules, staff)
    @staff = staff
    @schedules = schedules
    mail to:      staff.email,
    subject: 'インターン生出社通知'
  end
end
