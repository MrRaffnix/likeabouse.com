class CategoriesController < ApplicationController
  layout 'application'

  def show
    @category_id  = params[:id].to_i

    @category = Category.find_by_id(@category_id)
    @posts    = Post.by_category(@category_id).recent.page(params[:page] || 1)

    @title    = "Like a Bouse - #{@category.name}"

    if request.xhr?
      render "categories/show", category: @category, posts: @posts, layout: nil
    else
      render :show
    end
  end
end