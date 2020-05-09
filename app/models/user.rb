class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, PhotoUploader

  has_many :relationships
  has_many :donations, foreign_key: :giver_id
  has_many :receiver_donations, foreign_key: :receiver_id, class_name: "Donation"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  def friends
    relationships = Relationship.where("user_id = :id OR friend_id = :id", id: id).where(status: "accepted")
    friend_ids    = relationships.map(&:user_id) + relationships.map(&:friend_id)

    User.where.not(id: id).where(id: friend_ids.uniq)
  end

  def relationship_requests
    Relationship.where.not(user_id: id).
      where(friend_id: id, status: 'pending')
  end

  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  include PgSearch

  pg_search_scope :search,
                  against: [:first_name, :last_name, :email],
                  using: {
                    tsearch: { prefix: true }
                  }
end
