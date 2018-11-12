class PostsController < ApplicationController

  def index
    @posts = Post.all
      if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
 
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  
    redirect_to posts_path
  end

   private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
