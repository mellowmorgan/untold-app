require 'open-uri'
require 'csv'
class Request < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :descriptions, dependent: :delete_all
  before_save :downcase_categories
  before_save :status_check_nil
  validate :categories_must_exist
  # validates :status, presence: true, inclusion: { in: ["submitted","approved","published","flagged","denied"]}
  scope :most_recently_added_published, -> { where(status:"published").order(updated_at: :desc).limit(7)}
  scope :most_recently_added_all_published, -> { where(status:"published").order(updated_at: :desc)}
  scope :most_recently_added_all_approved, -> { where(status:"approved").order(created_at: :desc)}
  scope :most_recently_added_approved, -> { where(status:"approved").order(created_at: :desc).limit(7)}
  def downcase_categories
    if categories && categories.any?
      self.categories = self.categories.map{|word| word.downcase }
    end
  end
  def status_check_nil
    if !self.status
      self.status = "approved"
    end
  end
  
  def grab_image
    if self.image_url
      
      image_from_url = URI.open(self.image_url)
      self.image.attach(io: image_from_url, filename: "#{self.id}.jpg")
    end
  end
  def categories_must_exist
    valid_categories=["people","popular","nature","miscellaneous","objects", "art", "photography","film","landmarks","buildings","history","animals"]
    valid_checker=true
    if self.categories
      self.categories.each do |word|
        if !valid_categories.include?(word.downcase)
          valid_checker=false
        end
      end
      if self.categories.any? && !valid_checker
        errors.add(:categories, "You've entered an invalid category. Please include one or more of the following categories: people, popular, nature, miscellaneous, objects, history, film, photography, art, landmarks, buildings, animals")
      end
    end
  end
end

