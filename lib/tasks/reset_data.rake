namespace :reset do
  desc "reset all categories"
  task :categories => :environment do
    Post.all.each do |post|
      post.update_attribute(:category_id, nil)
    end
    
    Category.delete_all
  end
end