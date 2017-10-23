class Notice < ApplicationRecord
  has_many :users, through: :notice_user
  has_many :notice_user
end
