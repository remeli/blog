class StaticController < ApplicationController
  
  respond_to :html
  
  def index
    @posts = Post.rootposts
    respond_with @posts
  end

end
