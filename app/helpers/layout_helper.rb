module LayoutHelper
  def datetime_string(datetime)
    datetime.localtime.strftime "%d.%m.%y, %H:%M"
  end
end