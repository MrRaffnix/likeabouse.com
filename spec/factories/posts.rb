FactoryGirl.define do
  factory :post do |f|
    
    f.name { @name = Faker::Name.name }
    f.link { "https://www.google.de/#hl=de&output=search&sclient=psy-ab&q=#{@name}&oq=#{@name}"}
    f.description { Faker::Lorem.sentence(rand(10)+4) }
    f.category { Category.all.sample }
  end
end