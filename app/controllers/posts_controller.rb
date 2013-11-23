class PostsController < ApplicationController
  layout "application"

  respond_to :rss, only: [:feed]
  respond_to :html, only: [:index]

  #root
  def index
    page          = params[:page] || 1
    @posts        = Post.recent.page(page)

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

  def show
    @post     = Post.find(params[:id])

    @title    = "Like a Bouse - #{@post.name}"

    if request.xhr?
      render partial: "posts/post", object: @post
    else
      @category = Category.by_post(@post).first
      @posts    = @post.related_posts

      render :show
    end
  end

  def feed
    @posts = Post.top(25).recent.all
    respond_to do |format|
      format.rss {render layout: false, content_type: "application/rss"}
    end
  end
end