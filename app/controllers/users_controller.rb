class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:alert] = "#{user.username} was removed."
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
