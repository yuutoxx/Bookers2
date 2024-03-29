class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      user_path(current_user.id)
  end

  def create
    @user = sign_in(user_params)
    user_path(current_user.id)
    flash[:notice] = "Signed in successfully."

    @user = sign_up(user_params)
    user_path(current_user.id)
    flash[:notice] = "Welcome! You have signed up successfully."
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def destroy
    @user = log_out(user_params)
    root_path
    flash[:notice] = "Signed out successfully."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  def user_params
    params.require(:user).permit(:name, :passpord)
  end
end
