class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      current_user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
