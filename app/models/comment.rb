class Comment < ApplicationRecord
  validates :body, :artwork_id, :commenter_id, presence: true

  belongs_to :commenter,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: 'User'

  belongs_to :artwork

  include Likeable
end
