class Post < ActiveRecord::Base
  attr_accessible :name, :description, :link, :category_id, :author_id
  belongs_to :category
  belongs_to :author, class_name: "AdminUser"

  validate :name, :description, :link, :category_id, :author_id, presence: true

  scope :recent, order: "created_at DESC"
  scope :top, lambda { |l| limit(l) }
  scope :by_category, lambda { |category_id| where(category_id: category_id) }

end