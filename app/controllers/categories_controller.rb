class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered.with_posts.all
  end
  
  def show
  end
end