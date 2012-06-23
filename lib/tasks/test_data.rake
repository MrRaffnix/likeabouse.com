namespace :test_data do
  desc "create random posts"
  task :create_posts => :environment do
    amount = ENV["amount"] || 20
    
    amount.to_i.times do
      FactoryGirl.create(:post)
    end
  end
end