class OwnerController < ApplicationController
  before_action :require_owner

  private

  def require_owner
    return if current_user.owner?
    flash[:danger] = t ".danger"
    redirect_to root_path
  end
end
