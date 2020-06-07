class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :index, :show,:edit]
  before_action :correct_user,   only: [:edit, :update]
  def new
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	    @book = Book.new(book_params)
        @book.user_id = current_user.id
  	   if@book.save
        flash[:complete] = "You have creatad book successfully."
  	    redirect_to book_path(@book.id)
       else
        @books = Book.all
        render :new
       end
   end

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
  	@post = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def usershow
    @user = User.find(params[:id])
    @post = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
  end

  def update
  	if @book.update(book_params)
  	redirect_to book_path(@book.id)
  	flash[:notice] = "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
  	@post = Book.find(params[:id])
  	@post.destroy
  	redirect_to new_book_path
  	flash[:notice] = "Book was successfully destroyed"
  end

  def userinfo
    @book = Book.new
  end



  private
  def book_params
  	  params.require(:book).permit(:title, :body, :image)
  end
  def correct_user
      @book = Book.find(params[:id])
      redirect_to(books_path) unless @book.user == current_user
  end
 end
