class PostsController < ApplicationController
  layout "application"

  respond_to :rss, only: [:feed]
  respond_to :html, only: [:index]

  def index
    @posts = Post.recent.page(params[:page])

    if request.xhr?
      render "categories/show", category: @category, posts: @posts, layout: nil
    else
      render template: "categories/show"
    end
  end

  def search
    @posts = Post.search(params[:search]).page(params[:page])

    if request.xhr?
      render "categories/show", category: @category, posts: @posts, layout: nil
    else
      render template: "categories/show"
    end
  end

  def feed
    @posts = Post.top(20).recent.all
    respond_to do |format|
      format.rss {render layout: false, content_type: "application/rss"}
    end
  end
end