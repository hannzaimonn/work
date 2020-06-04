class InfosController < ApplicationController
	def new
  	@info = User.new
  end

  def create
  	book = Book.new(post_params)
  	book.save
  	redirect_to'/books/new'
  end

  private

   def post_params
   	   params.require(:book).permit(:title, :body,)
   end
end
