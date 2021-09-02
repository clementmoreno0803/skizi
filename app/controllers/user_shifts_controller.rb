class UserShiftsController < ApplicationController
  before_action :set_user_shift, only: [:update]
  def create
    p 'a que coucou'

    # @shift = Shift.find_by(started_at: params[:start], ended_at: params[:end])

    @shift = Shift.where('started_at <= ? AND ended_at >= ?', params[:start],  params[:end]).first


    ap "JE SUIS LA"
    ap @shift

    @user = User.find(params[:user_id])

    @user_shift = UserShift.create!(shift: @shift, employee: @user)

    data = @user_shift.attributes
    data[:shift] = @shift

    render json: data.to_json
  end

  def update

    user_shift_start = params[:start]
    user_shift_end = params[:end]

    @shift = Shift.where('started_at <= ? AND ended_at >= ?', params[:start],  params[:end]).first


    return head 404 if @shift.nil?

    @user_shift.update!(shift: @shift)

    data = @user_shift.attributes
    data[:shift] = @shift

    render json: data.to_json
  end

  private

  def set_user_shift
    @user_shift = UserShift.find(params[:id])
  end
end
