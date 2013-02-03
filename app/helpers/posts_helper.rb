module PostsHelper
  def link_to_category category
    link_to category.name, category_path(category), {:class => "jq_category_link", "data-tab-index" => category.id}
  end

  def post_as_link post
    link = link_to_blank post.name, post.link
    span = content_tag :span, "(#{truncate_link(post.link)})", class: "display_link"

    "#{link} #{span}".html_safe
  end

  def truncate_link(link)
    return "-" if link.nil?

    truncate(link.gsub("https://", "").gsub("http://", ""), length: 45)
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