class Donation < ApplicationRecord
  CATEGORIES = ["dairy and eggs", "drinks", "fruits and vegetables", "meat and fish"]

  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User", optional: true

  validates :status, presence: true, inclusion: { in: ["pending", "chosen", "confirmed"] }
  validates :categories, presence: true

  validate :categories_in_list

  has_one_attached :photo

  private

  def categories_in_list
    if categories.any? { |category| !CATEGORIES.include?(category) }
      errors.add(:category, :inclusion)
    end
  end
end
