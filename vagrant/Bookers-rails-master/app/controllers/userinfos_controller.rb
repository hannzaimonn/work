class UserinfosController < ApplicationController
  def new
  	@userinfo = User.new
  end

  def create
  	post = Post.new(post_params)
  	post.save
  	redirect_to'/posts/new'
  end

  private

   def post_params
   	   params.require(:post).permit(:title, :body, :category)
   end
end
