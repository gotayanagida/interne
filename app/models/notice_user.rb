class NoticeUser < ApplicationRecord
  belongs_to :user
  belongs_to :notice
end
