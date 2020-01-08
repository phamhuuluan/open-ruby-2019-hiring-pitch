class Booking < ApplicationRecord
  has_many :user_pitch_reactions, as: :reactions
  belongs_to :pitch, optional: true

  BOOKING_PARAMS = %i(message price booking_day).freeze

  validates :booking_day, presence: true, uniqueness: true
  validate :datetime

  def check_in pitch_id
    return unless booking_day

    pitch = find_by_pitch_id pitch_id

    if booking_day.hour <= pitch.end_time.hour && booking_day.hour >= pitch.start_time.hour
      errors.add :booking_day, I18n.t("luan")
    return true
    end
  end

  private

  def find_by_pitch_id pitch_id
    Pitch.find_by id: pitch_id
  end

  def datetime
    return unless booking_day
    return if booking_day > Date.today
    errors.add :booking_day, I18n.t("datetime")
  end
end
