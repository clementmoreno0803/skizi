class UserShiftsController < ApplicationController
  before_action :set_user_shift, only: %i[update destroy]
  def create
    @shift = Shift.where('started_at <= ? AND ended_at >= ?', params[:start],  params[:end]).first

    @user = User.find(params[:user_id])

    @user_shift = UserShift.create!(shift: @shift, employee: @user)

    data = @user_shift.attributes
    data[:shift] = @shift

    render json: data.to_json
  end

  def update
    user_shift_start = params[:start]
    user_shift_end = params[:end]

    @shift = Shift.where('started_at <= ? AND ended_at >= ?', user_shift_start, user_shift_end).first


    return head 404 if @shift.nil?

    @user_shift.update!(shift: @shift)

    data = @user_shift.attributes
    data[:shift] = @shift

    render json: data.to_json
  end

  def destroy
    @user_shift.destroy

    data = @user_shift.attributes
    data[:shift] = @shift

    render json: data.to_json
  end

  private

  def set_user_shift
    @user_shift = UserShift.find(params[:id])
  end
end
