class PostsController < ApplicationController
  layout "with_tabs"

  def recent
    @posts = Post.top(10).recent.all

    if request.xhr?
      render partial: "posts/index", locals: {posts: @posts}
    else
      @categories = Category.to_show
      @js_files   = ["tabs"]

      render "posts/recent"
    end
  end
end