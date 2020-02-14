require "rails_helper"

RSpec.describe UserPitchReaction, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:reactions) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:pitch) }
  end
end
