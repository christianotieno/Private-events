class UsersController < ApplicationController
  before_action :logged_in?, only: %i[index show destroy]
  before_action :correct_user, only: [:destroy]
  def index
    @users = User.all
  end

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
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  # Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
