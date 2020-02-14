class UserPitchReaction < ApplicationRecord
  belongs_to :reactions, polymorphic: true
  belongs_to :user
  belongs_to :pitch

  scope :comment_reaction, -> comment_id{where(reactions_type: Comment.name, reactions_id: comment_id)}
end
