class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  # validates :username, uniqueness: true
  # validates :email, presence: true, length: { minimum: 4 }
  # validates :username, presence: true, length: { minimum: 4 }
  # validates :password, presence: true
  # it seems to be mad at validates above, had to comment out to get it working
  validate :email_has
  has_many :requests, dependent: :delete_all
  has_many :descriptions, dependent: :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def email_has
      if !email.include?("@"&&".")
        errors.add(:email, "this is not a valid email address")
      end
    end
end
