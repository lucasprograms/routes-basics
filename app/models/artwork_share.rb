class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true, uniqueness: { scope: :artwork_id }

  belongs_to :viewer,
    foreign_key: :viewer_id,
    primary_key: :id,
    class_name: 'User'

  belongs_to :artwork,
    foreign_key: :artwork_id,
    primary_key: :id,
    class_name: 'Artwork'
end
