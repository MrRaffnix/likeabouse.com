module LayoutHelper
  def datetime_string(datetime)
    datetime.localtime.strftime "%d.%m.%y, %H:%M"
  end

  def ajax_tab_link(name, link, tab_index)
    link_to link, {"data-tab-index" => tab_index} do
      content_tag :span, name
    end
  end
end