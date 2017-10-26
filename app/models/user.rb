class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :schedules
  has_many :goals
  has_many :reports
  has_many :attendances
  has_many :notice_users
  has_many :notices, through: :notice_users
  has_many :todo_users
  has_many :todos, through: :todo_users
  has_many :company_users
  has_many :companies, through: :company_users

  def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end

end
