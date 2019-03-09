class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  def welcome_send
    WelcomeMailer.welcome_email(self).deliver
  end
end
