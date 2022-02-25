class Request < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: ["submitted","approved","published","flagged","denied"]}
  has_many :descriptions
  scope :most_recently_added_published, -> { where(status:"published").order(created_at: :desc).limit(10)}
end