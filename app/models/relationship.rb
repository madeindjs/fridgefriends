class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "declined"] }
end
