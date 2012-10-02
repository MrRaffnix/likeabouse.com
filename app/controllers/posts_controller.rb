class PostsController < ApplicationController
  layout "with_tabs"

  respond_to :rss, :only => [:feed]
  respond_to :html, :only => [:recent]

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

  def feed
    @posts = Post.top(20).recent.all
    respond_to do |format|
      format.rss {render :layout => false, :content_type => "application/rss"}
    end

  end
end