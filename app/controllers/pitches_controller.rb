class PitchesController < ApplicationController
  def show
    @pitch = Pitch.find_by id: params[:id]

    return if @pitch
    flash[:danger] = t ".not_found"
    redirect_to root_url
  end
end
