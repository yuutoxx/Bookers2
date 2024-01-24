class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.find_by(params[:id])
    @books = User.where(id: params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

    private

    def book_params
      params.require(:book).permit(:image, :title, :body, :id)
    end

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction, :id)
    end
end
