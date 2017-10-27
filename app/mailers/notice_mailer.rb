class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.send_day_before.subject
  #
  def send_day_before(user)
    @user = user
    mail to:      user.email,
         subject: '会員情報が更新されました。'
  end
end
