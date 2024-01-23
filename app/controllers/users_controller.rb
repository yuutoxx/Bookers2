class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
