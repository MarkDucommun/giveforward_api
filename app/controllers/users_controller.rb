class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    redirect_to user_path(user)
  end

  def show
    if user = User.find_by_token(params[:token])
      render json: { user: user.to_json }
    else
      render :show
    end
  end

  def get_token
    if user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
      render json: {token: user.token}
    else
      render json: {token: 'nope'}, status: :unauthorized
    end
  end
end