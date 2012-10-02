module HtmlHelper
  def link_to_blank(name, link, options = {})
    link_to name, link, options.merge(target: "blank")
  end

  def active_class(condition, klass = "")
    condition ? "#{klass} active".strip : klass
  end

  def bouse_pagination(objects)
    paginate(objects, remote: true, params: {pagination: 1}, theme: 'bouse')
  end

  def ajax_tab_link(name, link, tab_index)
    link_to link, {"data-tab-index" => tab_index} do
      content_tag :span, name
    end
  end

  def category_tab(category)
    ajax_tab_link category.name, category_path(category), category.id
  end
end