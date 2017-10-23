class Notice < ApplicationRecord
  has_many :notice_users
  has_many :users, through: :notice_users

  def self.generate_notice(user_id:, msg:)
    notice = Notice.create(body: msg)
    user = User.find(user_id)
    user.notices << notice
  end
end
