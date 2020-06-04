class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:new, :index, :show]

	def index
		@users = User.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

    def books
    	@users = User.all
    	@book = Book.new
    	@book = Book.all
    end

  private

   def user_params
   	   params.require(:user).permit(:name, :introduction, :image)
   end
end
