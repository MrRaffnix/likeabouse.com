module PostsHelper
  def link_to_category(category)
    link_to category.name, category_path(category), class: "jq_category_link", remote: true
  end

  def link_to_post(post)
    link_to_blank post.name, post.link
  end

  def link_to_post_link(post)
    link_to_blank truncate_link(post.link), post.link
  end

  def truncate_link(link)
    return "-" if link.nil?

    truncate link.gsub("https://", "").gsub("http://", ""), length: 35
  end

  def post_css_class(post)
    created_at = post.created_at

    if created_at >= 2.days.ago
      "post brand-new"
    elsif created_at >= 1.week.ago
      "post new"
    else
      "post old"
    end
  end

  def author_of_post post
    author = post.author
    if author.present?
      if author.first_name.present?
        author.first_name
      else
        author.email.gsub(/@.*/, "").titleize
      end
    end
  end
end