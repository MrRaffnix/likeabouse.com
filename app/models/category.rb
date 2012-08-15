class Category < ActiveRecord::Base
  attr_accessible :name, :description, :rank
  has_many :posts

  validate :name, presence: true
  validate :rank, presence: true, uniqueness: true

  scope :ordered, order: "rank ASC"
  scope :with_posts, includes(:posts)

  def self.to_show
    self.ordered.with_posts.all.select do |category|
      !category.no_posts?
    end
  end

  def no_posts?
    posts.empty?
  end
end