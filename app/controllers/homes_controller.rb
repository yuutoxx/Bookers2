class HomesController < ApplicationController
  def top
    @user = current_user
  end

  def about
  end

    private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
