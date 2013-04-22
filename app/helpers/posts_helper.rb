module PostsHelper

  def link_to_category(category)
    link_to category.name, category_path(category), class: "jq_category_link", remote: true
  end

  def link_to_post(post)
    link_to post.name, extended_post_path(post), class: "jq_open_post", remote: true
  end

  def link_external_to_post(post)
    link_to_blank post.name, post.link
  end

  def extended_post_path(post)
    "#{post_path(post)}-#{post.name_to_path}"
  end

  def exended_post_url(post)
    "#{post_url(post)}-#{post.name_to_path}"
  end

  def link_to_post_link(post, truncate = true)
    link_text = truncate ? truncate_link(post.link) : post.link

    link_to_blank link_text, post.link
  end

  def truncate_link(link)
    return "-" if link.nil?

    truncate link.gsub("https://", "").gsub("http://", ""), length: 35
  end

  def post_css_class(post)
    created_at = post.created_at

    if created_at >= 2.days.ago
      "brand-new"
    elsif created_at >= 1.week.ago
      "new"
    else
      "old"
    end
  end

  def post_to_json(post)
    post.as_json(only: [:id, :name]).to_json
  end

  def author_of_post(post)
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