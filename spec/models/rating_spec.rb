require "rails_helper"

RSpec.describe Rating, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:user_pitch_reactions) }
  end
end
