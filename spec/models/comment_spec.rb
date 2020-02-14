require "rails_helper"

RSpec.describe Comment, type: :model do
  let!(:comment){ FactoryBot.create(:comment) }
  let!(:comment1){ FactoryBot.create(:comment) }
  let!(:comment2){ FactoryBot.create(:comment) }
  describe "Associations" do
    it { is_expected.to have_many(:user_pitch_reactions) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "Scope" do
    context "#create_at_desc" do
      it{expect(Comment.all.comment_desc).to eq [comment2, comment1, comment]}
    end
  end
end
