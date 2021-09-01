class ShiftsController < ApplicationController
  before_action :find_shift, only: %i[edit update]


  def index
    @shifts = Shift.all
    @users = User.where("status = 'Ongoing'")
    @usershifts = UserShift.all
    @user_shifts = @usershifts.map do |usershift|
      {
        id: usershift.id,
        job: usershift.job,
        title: usershift.employee.username,
        start: usershift.shift.started_at,
        end: usershift.shift.ended_at
      }
    end
  end

  def search_employee
    if params[:query].present?
      sql_query = "\ users.username iLIKE :query \ OR jobs.job iLIKE :query"
      @users = User.joins(:jobs).where(sql_query, query: "%#{params[:query]}%").where("status = 'Ongoing'").distinct
    else
      @users = User.where("status = 'Ongoing'")
    end
  end

  def new
    @shift = Shift.new(shift_params)
  end

  def create
    shift_start = params[:start]
    shift_end = params[:end]

    @shift = Shift.create!(started_at: shift_start, ended_at: shift_end, manager: current_user)
    render json: @shift.to_json
    # Shift.new(started_at: shift_start, ended_at: shift_end)
  end
    # if @shift.save
    #   redirect_to shifts_path(@shift)
    # else
    #   puts "je suis la"
    #   format.html { redirect_to shifts_path(@shift) }
    #   format.json
    # end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to shift_path(@shift)
    else
      render :edit
    end
  end

  private

  def set_shift
    params.require(:shift).permit(params[:started_at], params[:ended_at])
  end

  def find_shift
    @shift = Shift.find(params[:id])
  end
end
