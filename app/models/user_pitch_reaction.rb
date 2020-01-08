class UserPitchReaction < ApplicationRecord
  belongs_to :reactions, polymorphic: true
  belongs_to :user
  belongs_to :pitch
end
