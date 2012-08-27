FactoryGirl.define do
  factory :category do |f|
    f.name { @name = Faker::Name.name }
    f.description { Faker::Lorem.sentence(rand(10)+4) }
    f.rank { 1 }
  end
end