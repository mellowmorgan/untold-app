class Request < ApplicationRecord
  belongs_to :user
  before_save :downcase_categories
  validates :content, presence: true
  validate :categories_must_exist
  validates :status, presence: true, inclusion: { in: ["submitted","approved","published","flagged","denied"]}
  has_many :descriptions
  scope :most_recently_added_published, -> { where(status:"published").order(created_at: :desc)}
  scope :most_recently_added_approved, -> { where(status:"approved").order(created_at: :desc)}
  def downcase_categories
    self.categories = self.categories.map{|word| word.downcase }
  end

  def categories_must_exist
    valid_categories=["people","popular","nature","miscellaneous","objects","landmarks","buildings","animals"]
    valid_checker=true
    self.categories.each do |word|
      if !valid_categories.include?(word.downcase)
        valid_checker=false
      end
    end

    if self.categories.any? && !valid_checker
      errors.add(:categories, "You've entered an invalid category. Please include one or more of the following categories: people, popular, nature, miscellaneous, objects, landmarks, buildings, animals")
    end
  end
end

