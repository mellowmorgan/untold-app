class Description < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :status, presence: true
  belongs_to :request

  private 
    def find_by_request(id)
      Description.where(request_id:id)
    end 
end