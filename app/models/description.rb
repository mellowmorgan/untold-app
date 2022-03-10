class Description < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :request_id, presence: true
  validates :status, presence: true, inclusion: { in: ["submitted","approved","published","flagged","denied"]}
  belongs_to :request
  def self.find_by_request(id)
    Description.where(request_id:id)
  end 
end