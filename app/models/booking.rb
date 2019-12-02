class Booking < ApplicationRecord
  has_many :user_pitch_reactions, as: :user_pitch_reactionable
end
