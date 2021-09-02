class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]

  def index
    select_sql = <<~SQL
      users.*,
      COALESCE(EXTRACT(epoch FROM SUM(current_shifts.ended_at - current_shifts.started_at)) / 3600, 0) as work_time_current_week,
      COALESCE(EXTRACT(epoch FROM SUM(next_shifts.ended_at - next_shifts.started_at)) / 3600, 0) as work_time_next_week
    SQL

    @users = User.select(select_sql)
                 .joins("LEFT JOIN user_shifts ON user_shifts.employee_id = users.id")
                 .joins("LEFT JOIN shifts as current_shifts ON user_shifts.shift_id = current_shifts.id AND EXTRACT('week' FROM current_shifts.started_at) = EXTRACT('week' FROM current_date)")
                 .joins("LEFT JOIN shifts as next_shifts ON user_shifts.shift_id = next_shifts.id AND EXTRACT('week' FROM next_shifts.started_at) = EXTRACT('week' FROM current_date) + 1")
                 .group(:id)
  end

  def search_user
    select_sql = <<~SQL
      users.*,
      COALESCE(EXTRACT(epoch FROM SUM(current_shifts.ended_at - current_shifts.started_at)) / 3600, 0) as work_time_current_week,
      COALESCE(EXTRACT(epoch FROM SUM(next_shifts.ended_at - next_shifts.started_at)) / 3600, 0) as work_time_next_week
    SQL

    @users = User.select(select_sql)
                 .joins("LEFT JOIN user_shifts ON user_shifts.employee_id = users.id")
                 .joins("LEFT JOIN shifts as current_shifts ON user_shifts.shift_id = current_shifts.id AND EXTRACT('week' FROM current_shifts.started_at) = EXTRACT('week' FROM current_date)")
                 .joins("LEFT JOIN shifts as next_shifts ON user_shifts.shift_id = next_shifts.id AND EXTRACT('week' FROM next_shifts.started_at) = EXTRACT('week' FROM current_date) + 1")
                 .group(:id)

    if params[:name].present?
      sql_query = "users.username iLIKE :name \ OR jobs.job iLIKE :name"
      @users = @users.joins(:jobs).where(sql_query, name: "%#{params[:name]}%").distinct
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.jobs << Job.where(id: params[:user][:user_job_ids])
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
      if params[:user][:user_job_ids]
        @user.user_jobs.destroy_all
        @user.jobs << Job.where(id: params[:user][:user_job_ids])
      end
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :contract_hours_per_week,
                                 :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
