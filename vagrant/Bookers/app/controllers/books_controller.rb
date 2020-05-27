class BooksController < ApplicationController

  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
    @books = Book.all
  	@book = Book.new(books_params)
    if @book.save
      flash[:complete] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render action: :index
    end
  end

  def update
    @books = Book.all
  	@book = Book.find(params[:id])
  	if @book.update(books_params)
      flash[:edit] = "Book was successfully updated."
  	  redirect_to book_path(@book.id)
    else
    render action: :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  def edit
  	@book = Book.find(params[:id])
  end

  private
    def books_params
      params.require(:book).permit(:title, :body)
    end
  end
