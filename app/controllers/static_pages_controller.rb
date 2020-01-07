class StaticPagesController < ApplicationController
  def home
    @pitches = Pitch.enable.select(Pitch::SELECT_HOME).page(params[:page]).per Settings.perpagehome
  end
end
