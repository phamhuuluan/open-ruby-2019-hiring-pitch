class PitchOwner < ApplicationRecord
  belongs_to :user
  belongs_to :pitch
end
