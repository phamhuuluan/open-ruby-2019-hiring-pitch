class CommentsController < ApplicationController
  before_action :load_pitch, only: :create
  before_action :logged_in_user, only: :create

  def create
    @comment =  Comment.new comment_params
    if @comment.save
      @comment.user_pitch_reactions.create(user: current_user, pitch: @pitch)
      respond_to :html, :js
    else
      flash[:danger] =  t ".fail"
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]

    if current_user.eql? UserPitchReaction.comment_reaction(@comment.id).first&.user
      @comment.destroy
    end

    if @comment.destroyed?
      flash[:success] = t ".delete_comment"
    else
      flash[:danger] =  t ".not_deleted"
    end
    redirect_to request.referrer || root_url
  end

  private

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
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
