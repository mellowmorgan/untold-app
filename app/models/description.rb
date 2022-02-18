class Description < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true
  belongs_to :request
end