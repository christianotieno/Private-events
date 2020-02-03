class UsersController < ApplicationController
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
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
