class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(session_params[:name])
    if @user
      session[:user_id]=@user.id
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  private

 
  def session_params
  params.require(:session).permit(:name)
  end

end
