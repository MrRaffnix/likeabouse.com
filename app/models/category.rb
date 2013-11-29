class Category < ActiveRecord::Base
  attr_accessible :name, :description, :rank
  has_many :posts

  validates :name, presence: true
  validates :rank, presence: true, uniqueness: true

  scope :ordered,     -> { order("rank ASC") }
  scope :with_posts,  -> { includes(:posts) }
  scope :by_post,     ->(post) { where(id: post.category_id) }


  def self.to_show
    self.ordered.with_posts.load.select do |category|
      !category.no_posts?
    end
  end

  def recent_posts(page = nil)
    posts.recent.page(page || 1)
  end

  def no_posts?
    posts.empty?
  end
end