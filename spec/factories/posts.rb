FactoryGirl.define do
  factory :post do |f|
    f.name { @name = Faker::Name.name }
    f.link { "http://#{Faker::Internet.domain_name}/#{@name}/show/me"}
    f.description { Faker::Lorem.sentence(rand(10)+4) }
    f.association :author, factory: :admin_user
  end

  factory :post_with_category, parent: :post do |f|
    f.association :category, factory: :category
  end
end