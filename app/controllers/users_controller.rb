class UsersController < ApplicationController
  def new
    @user = User.new 
  end 

  def create 
    @user = User.new user_params

    if @user.save
      log_in @user
      redirect_to root_path
    else
      flash[:danger] =  t ".error"
      render :new
    end
  end
  
  def show 
    @user = User.find_by id: params[:id]
      
    return if @user 
    flash[:danger] =  t ".no_user"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end
end
