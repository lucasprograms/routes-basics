class Like < ApplicationRecord
  validates :likeable_id, presence: true, uniqueness: { scope: [:likeable_type, :user_id]}
  validates :likeable_type, :user_id, presence: true
  
  belongs_to :likeable, polymorphic: true
end
