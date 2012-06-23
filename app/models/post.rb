class Post < ActiveRecord::Base
  attr_accessible :name, :description, :link, :category_id, :author_id
  belongs_to :category
  belongs_to :author, :class_name => "AdminUser"
  
  validate :name, :description, :link, :category_id, :author_id, :presence => true
end
