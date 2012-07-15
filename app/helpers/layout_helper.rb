module LayoutHelper
  def datetime_string(datetime)
    datetime.strftime "%d.%m.%y, %H:%M"
  end

  def ajax_tab_link(name, link)
    link_to link do
      content_tag :span, name
    end
  end
end