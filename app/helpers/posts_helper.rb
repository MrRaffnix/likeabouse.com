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

    truncate link.gsub("https://", "").gsub("http://", ""), length: 40
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