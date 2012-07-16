module CategoriesHelper
  def category_tab(category)
    ajax_tab_link category.name, category_path(category), category.id
  end
end