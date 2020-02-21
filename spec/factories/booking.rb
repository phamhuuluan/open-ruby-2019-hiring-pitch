FactoryBot.define do
  factory :booking do
    booking_day {FFaker::Time.between(DateTime.now + 1, DateTime.now )}
  end
end
