class Post < ActiveRecord::Base
  attr_accessible :name, :description, :link, :category_id
  belongs_to :category  
end
