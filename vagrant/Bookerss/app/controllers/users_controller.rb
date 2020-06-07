class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:new, :index, :show,:edit]
    before_action :correct_user,   only: [:edit, :update]

    def new
  	@books = Book.all
  	@book = Book.new
    end
	def index
		@users = User.all
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
	end

	def update
		if@user.update(user_params)
        flash[:complete] = "You have updated user successfully."
		redirect_to user_path(@user)
		else
		@users = User.all
		render :edit
	    end
	end

    def books
    	@users = User.all
    	@user = User.find(params[:id])
    	@book = Book.new
    	@book = Book.all
    end

  private
   def user_params
   	   params.require(:user).permit(:name, :introduction, :profile_image)
   end
   def correct_user
      @user = User.find(params[:id])
      redirect_to(user_path(current_user.id)) unless @user == current_user
    end
   end
