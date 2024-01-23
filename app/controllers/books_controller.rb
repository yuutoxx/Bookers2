class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :body)
  end
end
