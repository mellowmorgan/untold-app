class Request < ApplicationRecord
  belongs_to :user
  before_save :downcase_categories
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: ["submitted","approved","published","flagged","denied"]}
  has_many :descriptions
  scope :most_recently_added_published, -> { where(status:"published").order(created_at: :desc)}
  scope :most_recently_added_approved, -> { where(status:"approved").order(created_at: :desc)}
  def downcase_categories{
    self.categories.map{|word| word.downcase }
  }
end