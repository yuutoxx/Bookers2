class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "You have created book successfully."
    else
       render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
       redirect_to book_path(book.id)
    else
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    user = User.find_by(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
