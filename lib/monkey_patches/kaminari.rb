module Kaminari
  # = Helpers
  module ActionViewExtension
    # Renders a helpful message with numbers of displayed vs. total entries.
    # Ported from mislav/will_paginate
    #
    # ==== Examples
    # Basic usage:
    #
    #   <%= page_entries_info @posts %>
    #   #-> Displaying posts 6 - 10 of 26 in total
    #
    # By default, the message will use the humanized class name of objects
    # in collection: for instance, "project types" for ProjectType models.
    # Override this with the <tt>:entry_name</tt> parameter:
    #
    #   <%= page_entries_info @posts, :entry_name => 'item' %>
    #   #-> Displaying items 6 - 10 of 26 in total
    # def page_entries_info(collection, options = {})
    #   entry_name = options[:entry_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
    #   if collection.num_pages < 2
    #     case collection.total_count
    #     when 0; "No #{entry_name.pluralize} found"
    #     when 1; "Displaying <b>1</b> #{entry_name}"
    #     else;   "Displaying <b>all #{collection.total_count}</b> #{entry_name.pluralize}"
    #     end
    #   else
    #     offset = (collection.current_page - 1) * collection.limit_value
    #     %{Displaying #{entry_name.pluralize} <b>%d&nbsp;-&nbsp;%d</b> of <b>%d</b> in total} % [
    #       offset + 1,
    #       offset + collection.count,
    #       collection.total_count
    #     ]
    #   end
    # end
    
    def page_entries_info(collection, options = {})
      entry_name = options[:entry_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
      if collection.num_pages < 2
        case collection.total_count
        when 0 
          "No #{entry_name.pluralize} found"
        when 1
          "Displaying " + content_tag(:span, 1, class: "number") + " #{entry_name}"
        else
          "Displaying " + content_tag(:span, "all #{collection.total_count}", class: "number") + " #{entry_name.pluralize}"
        end
      else
        offset  = (collection.current_page - 1) * collection.limit_value
        
        range   = content_tag :span, "#{offset+1} - #{offset+collection.count}", class: "number"
        total   = content_tag :span, collection.total_count, class: "total"
        
        "Displaying #{entry_name.pluralize} #{range} of #{total} in total"
      end
    end
  end
end
