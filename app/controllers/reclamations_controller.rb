class ReclamationsController < ApplicationController

  def new
    @reclamation = Reclamation.new
    @shift = Shift.find(params[:shift_id])
  end

  def create
    @reclamation = Reclamation.new(reclamation_params)
    @shift = Shift.find(params[:shift_id])
    @reclamation.Shift = @shift
    @reclamation.employee = current_user

    if @reclamation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def reclamation_params
    params.require(:reclamation).permit(:content)
  end
end
