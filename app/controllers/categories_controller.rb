class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @posts = Post.all
  end
  
  def show
  end
end