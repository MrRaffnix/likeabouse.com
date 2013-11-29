FactoryGirl.define do
  factory :admin_user do |f|
    f.sequence(:email) { |n| "admin_user_#{n}@likeabouse.com"}
    f.password { "password" }
    f.password_confirmation { "password" }
  end
end