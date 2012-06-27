class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered.with_posts.all
  end
  
  def show
    @category = Category.find_by_id(params[:id])
    @posts    = Post.by_category(@category.id).recent.page(params[:page] || 1)
  end
end