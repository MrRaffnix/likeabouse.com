module LayoutHelper
  def datetime_string(datetime)
    datetime.localtime.strftime "%d.%m.%Y %H:%M"
  end
end