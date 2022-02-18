class Description < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true
  belongs_to :request
  # scope :find_by_request, -> (request_id_param) { where(request_id: request_id_param) }
  def self.find_by_request(id)
    Description.where(request_id:id)
  end 
end