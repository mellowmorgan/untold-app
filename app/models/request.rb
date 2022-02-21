class Request < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: ["submitted","approved","published"]}
  has_many :descriptions
end