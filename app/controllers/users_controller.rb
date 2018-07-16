class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit update destroy)

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = t ".info"
      redirect_to root_url
    else
      flash[:danger] = t ".danger"
      render :new
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".danger"
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
