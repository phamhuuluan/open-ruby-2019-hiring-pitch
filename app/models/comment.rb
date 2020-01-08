class Comment < ApplicationRecord
  has_many :user_pitch_reactions, as: :reactions
end
