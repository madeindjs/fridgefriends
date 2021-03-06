class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many_attached :photo
  after_commit :add_default_avatar, on: %i[create update]

  has_many :relationships
  has_many :donations, foreign_key: :giver_id
  has_many :receiver_donations, foreign_key: :receiver_id, class_name: "Donation"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  
  validates :photo, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }
  validates :avatar, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes }
  
  # def avatar_thumbnail
  #   if avatar.attached?
  #     avatar.variant(resize_to_fit: [120, 120]).processed
  #   else
  #     avatar.attach(io: File.open('app/assets/images/default_profile.jpg'),
  #     filename: 'default_profile.jpg', content_type: 'image/jpg')
  #     # "/default_profile.jpg"
  #   end
  # end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_fit: [120, 120]).processed || avatar.variant(resize_to_limit: [120, 120]).processed.service_url
    else
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.jpg'
          )
        ), 
        filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
    end
  end

  def friends
    relationships = Relationship.where("user_id = :id OR friend_id = :id", id: id).where(status: "accepted")
    friend_ids    = relationships.map(&:user_id) + relationships.map(&:friend_id)

    User.where.not(id: id).where(id: friend_ids.uniq)
  end

  def relationship_requests
    Relationship.where.not(user_id: id).
      where(friend_id: id, status: 'pending')
  end

  # au lieu de supprimer, indiquer que l'utilisateur a demandé une suppression et l'horodater
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # supprime en BD le user mais pas les donations en cours ni les friendslink
  def hard_delete
    userdel = User.find(id)
    userdel.delete
  end

  # s'assurer que le compte de l'utilisateur est actif
  def active_for_authentication?
    super && !deleted_at
  end

  # fournir un message personnalisé pour un compte supprimé
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  # Attention ici il faudra surement changer par `include PgSearch::Model`
  include PgSearch

  pg_search_scope :search,
                  against: [:first_name, :last_name, :email],
                  using: {
                    tsearch: { prefix: true }
                  }

  def avatar_url
    if self.avatar.attachment
      self.avatar.attachment.service_url
    end
  end

  private
    
    def add_default_avatar
        unless avatar.attached?
            avatar.attach(
            io: File.open(
                Rails.root.join(
                'app', 'assets', 'images', 'default_profile.jpg'
                )
            ), 
            filename: 'default_profile.jpg',
            content_type: 'image/jpg'
            )
        end
    end

end
