class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_many :schedules
  has_many :goals
  has_many :reports
  has_many :attendances
  has_many :report_stamps
  has_many :goal_stamps
  has_many :notice_users
  has_many :notices, through: :notice_users
  has_many :todo_users
  has_many :todos, through: :todo_users
  has_many :task_users
  has_many :tasks, through: :task_users
  has_many :company_users
  has_many :companies, through: :company_users

  # def self.from_omniauth(auth)
  #   find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.username = auth["info"]["nickname"]
  #   end
  # end
  #
  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"]) do |user|
  #       user.attributes = params
  #     end
  #   else
  #     super
  #   end
  # end
  #
  # def self.find_for_google_oauth2(auth)
  #   user = User.where(email: auth.info.email).first
  #   unless user
  #     user = User.create(name: auth.info.name,
  #       provider: auth.provider,
  #       uid:      auth.uid,
  #       email:    auth.info.email,
  #       #token:    auth.credentials.token,
  #       password: Devise.friendly_token[0, 20])
  #   end
  #   user
  # end
  def password_required?
    super if confirmed?
  end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
