class StaticPagesController < ApplicationController
  def home
    @pitches = Pitch.enable.search_pitch(params[:search]).select(Pitch::SELECT_HOME).page(params[:page]).per Settings.perpagehome
  end
end
