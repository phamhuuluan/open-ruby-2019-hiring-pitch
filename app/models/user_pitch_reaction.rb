class UserPitchReaction < ApplicationRecord
  belongs_to :user_pitch_reactionable, polymorphic: true
end
