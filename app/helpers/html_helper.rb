module HtmlHelper
  
  def link_to_blank(name, link, options = {})
    link_to name, link, options.merge(target: "blank")
  end
end