FactoryBot.define do
  factory :comment do
    content {FFaker::Lorem.word}
  end
end
