module HtmlHelper
  def link_to_blank(name, link, options = {})
    link_to name, link, options.merge(target: "blank")
  end

  def active_class(condition, klass = "")
    condition ? "#{klass} active".strip : klass
  end
end