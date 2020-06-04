class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def new
  	@posts = Post.all
  	@post = Post.new
  end

  def create
  	    @post = Post.new(post_params)
        @post.user_id = current_user.id
  	   if@post.save
  	    redirect_to post_path(@post.id)
       else
        @posts = Post.all
        render :new
       end
   end

  def index
  	@posts = Post.all
    @post = Post.new

  end

  def show
  	@book = Post.find(params[:id])
    @posts = Post.all
    @post = Post.new

  end

  def usershow
    @book = Post.find(params[:id])
    @posts = Post.all
    @post = Post.new
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to post_path(post.id)
  	flash[:notice] = "Book was successfully update"
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to new_post_path
  	flash[:notice] = "Book was successfully destroyed"
  end

  def userinfo
    @post = Post.new
  end

  private
  def post_params
  	  params.require(:post).permit(:title, :body, :image)
  end
end