class Category < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :posts
  
  validate :name,   presence: true
  validate :order,  presence: true, uniqueness: true
end
