FactoryGirl.define do
  factory :category do |f|
    f.name { Faker::Name.name }
    f.description { Faker::Lorem.sentence(rand(10)+4) }
    f.sequence(:rank) { |n| n+1 }
  end
end