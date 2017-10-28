class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "gotayanagida5@gmail.com",
          reply_to: "gotayanagida5@gmail.com"
  layout 'mailer'
end
