module Likeable
  extend ActiveSupport::Concern
  included do
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :users, through: :likes
    after_create :create_like
  end

  def create_like(user_id)
    Like.create!(likeable_type: self.class.name, likeable_id: self.id, user_id: user_id)
  end
end