class Category < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :posts
  
  validate :name,   presence: true
  validate :rank,  presence: true, uniqueness: true
  
  scope :ordered, order: "rank ASC"
  scope :with_posts, includes(:posts)
end
