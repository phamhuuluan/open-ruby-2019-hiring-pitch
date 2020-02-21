class Comment < ApplicationRecord
  has_many :user_pitch_reactions, as: :reactions
  COMMENT_PARAMS =  %i(content).freeze

  validates :content, presence: true

  scope :comment_desc, -> {order created_at: :desc}
end
