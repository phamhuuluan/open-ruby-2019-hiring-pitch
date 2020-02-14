FactoryBot.define do
  factory :user do
    fullname {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {"123123"}
  end
end
