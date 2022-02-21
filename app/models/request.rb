class Request < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: ["submitted","approved","published","flagged","denied"]}
  has_many :descriptions
end