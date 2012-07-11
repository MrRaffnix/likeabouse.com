class CategoriesController < ApplicationController
  layout 'with_tabs'
  
  before_filter :load_categories
  
  def index
  end
  
  def show
    @category_id  = params[:id].to_i
    
    @category = Category.find_by_id(@category_id)
    @posts    = Post.by_category(@category_id).recent.page(params[:page] || 1).per(12)
    if request.xhr?
      render partial: "categories/show", locals: {category: @category, posts: @posts}
    else
      @selected_tab = @categories.map(&:id).index(@category_id)
      @js_files     = ["tabs"]
      render :show
    end
  end
  
  private
    def load_categories
      @categories = Category.ordered.all
    end  
end