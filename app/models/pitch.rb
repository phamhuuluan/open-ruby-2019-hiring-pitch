class Pitch < ApplicationRecord
  has_many :pitch_owners
  has_many :user_pitch_reactions, as: :user_pitch_reactionable
end
