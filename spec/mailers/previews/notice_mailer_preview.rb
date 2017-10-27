# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notice_mailer/send_day_before
  def send_day_before
    NoticeMailerMailer.send_day_before
  end

end
