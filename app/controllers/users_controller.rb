class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def get_token
    if user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
      render json: {token: user.token}
    else
      render json: {token: 'nope'}, status: :unauthorized
    end
  end
end