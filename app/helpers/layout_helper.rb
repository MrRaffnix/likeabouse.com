module LayoutHelper
  def datetime_string(datetime)
    return "-" if datetime.nil?

    datetime.localtime.strftime "%d.%m.%Y %H:%M"
  end
end