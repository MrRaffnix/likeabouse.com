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
  

  def tiny_tag(name)
    sprite_tag "tiny", name
  end

  def minor_tag(name)
    sprite_tag "minor", name
  end

  def medium_tag(name)
    sprite_tag "medium", name
  end

  def sprite_tag(size, name)
    content_tag :div, "&nbsp;".html_safe, class: "#{size}_#{name} #{size}"
  end
end