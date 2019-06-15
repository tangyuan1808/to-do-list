FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password_digest { Faker::Internet.password }
  end

  factory :list do
    name { Faker::Name.name }
  end

  factory :to_do do
    name { Faker::Name.name }
    description { Faker::DcComics.title }
  end
end