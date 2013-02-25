class PostsController < ApplicationController
  layout "application"

  respond_to :rss, :only => [:feed]
  respond_to :html, :only => [:recent]

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(12)
  end

  def recent
    @posts = Post.top(10).recent.all

    if request.xhr?
      render partial: "posts/index", locals: {posts: @posts}
    else
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