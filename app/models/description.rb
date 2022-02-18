class Request < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, true
end