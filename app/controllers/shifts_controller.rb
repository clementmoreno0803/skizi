class ShiftsController < ApplicationController
  before_action :find_shift, only: %i[show destroy edit update]

  def index
    @shifts = Shift.all
    @usershifts = UserShift.all
    @users = User.all
    search_bar
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

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to shifts_path(@shift)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to shift_path(@shift)
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path
  end

  private

  def shift_params
    params.require(:shift).permit(:started_at, :ended_at, :job, :status)
  end

  def find_shift
    @shift = Shift.find(params[:id])
  end

  def search_bar
    if params[:query].present?
      sql_query = "\ users.username @@ :query \ OR jobs.job @@ :query"
      @users = User.joins(:jobs).where(sql_query, query: "%#{params[:query]}%")
    end
  end
end
