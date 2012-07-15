class CategoriesController < ApplicationController
  layout 'with_tabs'

  def show
    @category_id  = params[:id].to_i

    @category = Category.find_by_id(@category_id)
    @posts    = Post.by_category(@category_id).recent.page(params[:page] || 1).per(12)

    if request.xhr?
      if params[:pagination].present?
        render partial: "categories/page", locals: {category: @category, posts: @posts}
      else
        render partial: "categories/show", locals: {category: @category, posts: @posts}
      end
    else
      @selected_tab = @categories.map(&:id).index(@category_id)
      @categories   = Category.to_show

      @js_files     = ["tabs"]
      render :show
    end
  end
end