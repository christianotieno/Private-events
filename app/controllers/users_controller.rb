class UsersController < ApplicationController
  before_action :logged?, only: [new]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user.id
      current_user
      redirect_to @user
      flash[:success] = 'User created'
    else
      flash[:info] = 'Invalid name/email'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    
    @current_user = current_user
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  private

  def logged?
    redirect_to login_url unless logged_in?
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
