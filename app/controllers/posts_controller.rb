class PostsController < ApplicationController
  
  def index
    @posts=Post.all
    respond_to do |f|
    f.html
    f.json {render :json=>@posts}
    end
    
  end
  
  def show
  
    @post.Post.find(paramd[:id])
    respond_to do |f|
    f.html
    f.json {render :json=>@post}
    end
    
  end
  
  def new
    @post=Post.new
    respond_to do |f|
    f.html
    f.json {render :json=>@post}
    end
  end
  
  def edit
  @post=Post.find(params[:id])
    
  end
  
  def create
    @post=Post.new(params[:post])
    respond_to do |f|
      f.html { redirect_to @post, :notice=>'Post created!'}
      f.json {render :json=>@post}
    end    
  end
  
  def update
    @post=Post.find(params[:id])
    
    respond_to do |f|
      format.html { redirect_to @post, :notice => 'Post updated!' }
      format.json { head :ok }
    end    
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
    format.html { redirect_to post_url }
    format.json { head :ok }
    end
  end

end
