class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true, length: { minimum: 4 }
  validates :username, presence: true, length: { minimum: 4 }
  validates :password, presence: true
  validate :email_has
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def email_has
      if !email.include?("@"&&".")
        errors.add(:email, "this is not a valid email address")
      end
    end
end
