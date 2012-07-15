module PostsHelper

  def link_to_category category
    link_to category.name, category_path(category)
  end

  def post_information post
    author = author_of_post post
    post_information = datetime_string post.created_at
    post_information = "#{post_information}, by #{author}" if author.present?

    post_information
  end

  def author_of_post post
    if post.author.present?
      if post.first_name.present?
        post.author.first_name
      else
        post.author.email.gsub(/@.*/, "")
      end
    end
  end
end