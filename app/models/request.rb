class Request < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true
  has_many :descriptions
end