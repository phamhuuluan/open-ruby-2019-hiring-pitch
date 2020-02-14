require "rails_helper"

RSpec.describe Pitch, type: :model do
  let!(:user1){ FactoryBot.create :user }
  let!(:pitch){ FactoryBot.create(:pitch, user: user1) }
  let!(:pitch1){ FactoryBot.create(:pitch, user: user1) }
  let!(:pitch2){ FactoryBot.create(:pitch, user: user1) }
  describe "Associations" do
    it { is_expected.to have_many(:bookings) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:user_pitch_reactions).class_name("UserPitchReaction")}
    it { is_expected.to belong_to(:user) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }

    context "when image size lager" do
      before{pitch.update(image: "image_pitch.jpg") }
      it "after update" do
        expect(pitch.image.size).to be < Settings.users.avatar_size.size.megabytes
      end
    end
  end

  describe "Scope" do
    describe "#create_at_desc" do
      it{expect(Pitch.all.create_at_desc).to eq [pitch2, pitch1, pitch]}
    end

    describe "#search_pitch" do
      let(:search_pitch){FactoryBot.create(:pitch, user: user1,
        description: "San co nhan tao", address: "Ha Noi")}
      it "finds a searched pitch by description or address" do
        expect(Pitch.search_pitch("Ha Noi")).to eq [search_pitch]
      end
    end
  end
end
