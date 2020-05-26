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
  	book = Book.new(books_params)
    book.save
    redirect_to book_path(book.id)
  end
  def update
  	book = Book.find(params[:id])
  	book.update(books_params)
  	redirect_to book_path(book.id)
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to book_path
  end


  def edit
  	@book = Book.find(params[:id])
  end
  private
    def books_params
      params.require(:book).permit(:title, :body)
    end
end
