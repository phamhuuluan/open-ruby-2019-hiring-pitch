class ChangeDateBookingController < ApplicationController
  def show
    @time = []
    pitch = Pitch.find_by id: params[:id]
    for i in pitch.start_time.hour..pitch.end_time.hour
      @time << i
    end

    booking = UserPitchReaction.where(reactions_type: Booking.name, pitch_id: params[:id]).pluck(:reactions_id)
    ordered_time = Booking.where(id: booking, booking_day: params[:datetime].to_date.beginning_of_day..params[:datetime].to_date.end_of_day)
      .pluck(:booking_day).map{|time| time.hour}
    @result = @time - ordered_time

    respond_to :js
  end
end
