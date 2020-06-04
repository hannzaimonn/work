class BooksController < ApplicationController

	before_action :authenticate_user!, only: [:new]

  def new
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	    @book = Book.new(book_params)
        @book.user_id = current_user.id
  	   if@book.save
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
  	@user = Book.find(params[:id])
    @books = Book.all
    @book = Book.new

  end

  def usershow
    @user = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)
  	flash[:notice] = "Book was successfully update"
  end

  def destroy
  	user = Book.find(params[:id])
  	book.destroy
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
end
