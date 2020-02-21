require "rails_helper"

RSpec.describe Booking, type: :model do
  let!(:booking){ FactoryBot.create :booking }
  describe "Associations" do
    it { is_expected.to have_many(:user_pitch_reactions) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:booking_day) }

    context "when datetime valid " do
      before{booking.update(booking_day: Date.today + 1.day) }
      it "after update" do
        expect(booking.booking_day).to be > Date.today
      end
    end
  end
end
