class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def search_user
    if params[:name].present?
      sql_query = "\ users.username iLIKE :name \ OR jobs.job iLIKE :name"
      @users = User.joins(:jobs).where(sql_query, name: "%#{params[:name]}%").distinct
    else
      @users = User.all
    end

    ap "je sui sla"
    ap @users.all
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
end
