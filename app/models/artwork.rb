class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :artist_id, :image_url, presence: true

  belongs_to :artist,
    class_name: 'User',
    dependent: :destroy

  has_many :artwork_shares
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
  has_many :comments,
    dependent: :destroy
  has_many :commenting_users,
    -> { distinct },
    through: :comments,
    source: :commenter

  include Likeable
end
