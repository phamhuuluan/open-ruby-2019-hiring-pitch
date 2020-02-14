FactoryBot.define do
  factory :pitch do
    description {FFaker::Name.name}
    start_time {FFaker::Time.between(DateTime.now - 2, DateTime.now - 1 )}
    end_time {FFaker::Time.between(DateTime.now - 1, DateTime.now )}
  end
end
