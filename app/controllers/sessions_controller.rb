class SessionsController < ApplicationController
  include ApplicationHelper
  def new; end

  def create

    @user = User.find_by(session_params[:name])
    if @user
      session[:user_id]=@user.id

    @user = User.find_by(name: params[:session][:name].downcase)
    if @user
      login_url @user
      redirect_to @user

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
end