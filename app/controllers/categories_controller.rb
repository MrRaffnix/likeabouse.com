class CategoriesController < ApplicationController
  layout 'application'

  def show
    @category_id  = params[:id].to_i

    @category     = Category.find_by_id(@category_id)
    @posts        = @category.recent_posts(params[:page])

    @title        = "Like a Bouse - #{@category.name}"

    if request.xhr?
      render "categories/show", category: @category, posts: @posts, layout: nil
    else
      render :show
    end
  end
end