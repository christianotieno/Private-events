class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = 'User created'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
