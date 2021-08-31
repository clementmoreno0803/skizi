class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]

  def index
    @users = User.all
    search_bar
  end

  def search_user
    if params[:test].present?
      sql_query = "\ users.username iLIKE :test \ OR jobs.job iLIKE :test"
      @users = User.joins(:jobs).where(sql_query, test: "%#{params[:test]}%").distinct
    else
      @users = User.all
    end
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
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :contract_hours_per_week, :password, :password_confirmation, user_job_ids: [])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def search_bar
    if params[:test].present?
      sql_query = "\ users.username iLIKE :test \ OR jobs.job iLIKE :test"
      @users = User.joins(:jobs).where(sql_query, test: "%#{params[:test]}%").distinct
    end
  end
end
