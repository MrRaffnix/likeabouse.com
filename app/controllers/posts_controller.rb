class PostsController < ApplicationController
  layout "full"
  
  def recent
    @posts = Post.top(10).recent.all
  end
  
  def index
  end
  
  def show
  end
end