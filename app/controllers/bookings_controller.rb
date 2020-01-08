class BookingsController < ApplicationController
  before_action :load_pitch, only: %i(new create)
  before_action :logged_in_user, only: %i(new create)

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new booking_params

    if @booking.check_in(params[:pitch_id]) && @booking.save
      @booking.user_pitch_reactions.create(user: current_user, pitch: @pitch)
      flash[:success] =  t ".successful"
      redirect_to root_url
    else
      flash[:danger] =  t ".fail"
      redirect_to new_pitch_booking_url
    end
  end

  private

  def booking_params
    params.require(:booking).permit(Booking::BOOKING_PARAMS).merge(price: @pitch.price)
  end

  def load_pitch
    @pitch = Pitch.find_by id: params[:pitch_id]

    return if @pitch
    flash[:danger] = t ".not_found"
    redirect_to root_url
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = t ".loggin"
    redirect_to login_url
  end
end
