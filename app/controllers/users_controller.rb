class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index new create]
  before_action :find_user, only: %i[show edit update]

  def index
    @users = User.all
    search_bar
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
    params.require(:user).permit(:username, :email, :contract_hours_per_week, :password, :password_confirmation, user_job_ids: [])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def search_bar
    if params[:query].present?
      sql_query = "\ users.username @@ :query"
      @users = @users.where(sql_query, query: "%#{params[:query]}%")
    end
    if params[:job].present?
      sql_query2 = "\ jobs.job @@ :job"
      @users = User.joins(:jobs).where(jobs: { job: params[:job] }).distinct
    end
  end
end
