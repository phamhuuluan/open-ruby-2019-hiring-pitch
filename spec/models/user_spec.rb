require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user){ FactoryBot.create :user }
  describe "Associations" do
    it { is_expected.to have_many(:pitches).dependent(:destroy) }
    it { is_expected.to have_many(:user_pitch_reactions).class_name("UserPitchReaction") }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:fullname) }
    it { is_expected.to validate_length_of(:fullname).is_at_most(Settings.users.name.max_length) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(Settings.users.email.max_length) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password).allow_nil }
    it { is_expected.to validate_length_of(:password).is_at_least(Settings.users.password.max_length) }

    context "when email valid format" do
      it { should allow_value("luanphamm15@gmail.com").for(:email) }
    end

    context "when avata size lager" do
      before{user.update(avatar: "image_pitch.jpg") }
      it "after update" do
        expect(user.avatar.size).to be < Settings.users.avatar_size.size.megabytes
      end
    end
  end

  describe "Instance Method" do
    describe "#downcase_email" do
      let(:user){ FactoryBot.create :user }
      it "Before save" do
        expect(user.email).to eq(user.email.downcase)
      end
    end
  end

  describe "Class Method" do
    describe ".digest" do
      it "After call digest method" do
        expect(User.digest "123456").not_to be_nil
      end
    end
  end
end
