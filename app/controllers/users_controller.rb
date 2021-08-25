class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :find_dev, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :jobs, :email, :contract_hours_per_week, :password, :password_confirmation)
  end

  def find_user
    @user = user.find(params[:id])
  end
end
