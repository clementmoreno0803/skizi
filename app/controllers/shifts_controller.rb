class ShiftsController < ApplicationController
  before_action :find_dev, only: %i[show destroy edit update]
  def index
    @shifts = Shift.all
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
    @shift = shift.find(params[:id])
  end
end
