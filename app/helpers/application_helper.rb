module ApplicationHelper
  def left_categories
    @left_categories ||= categories_to_show[0...(categories_to_show.count/2).ceil]
  end

  def right_categories
    @right_categories ||= categories_to_show - left_categories
  end
end
