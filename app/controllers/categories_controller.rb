class CategoriesController < ApplicationController
  def index
    @categories = Category.ordered.with_posts.all
  end
  
  def show
    @category_id = params[:id].to_i
    
    @category = Category.find_by_id(@category_id)
    @posts    = Post.by_category(@category_id).recent.page(params[:page] || 1)
  end
end