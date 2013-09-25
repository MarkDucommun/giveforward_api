class FundraisersController < ApplicationController
  def index
    if user = User.find_by_token(params[:token])
      render json: {fundraisers: Fundraiser.all.to_json }
    else
      render json: {fundraiser: 'nope'}, status: 401
    end
  end

  def create
    if user = User.find_by_token(params[:token]) 
      fundraiser = user.created_fundraisers.create(params[:fundraiser])
      render json: {fundraiser: fundraiser.to_json}
    else
      render json: {fundraiser: 'nope'}, status: 401
    end
  end

  def show
    if user = User.find_by_token(params[:token])
      render json: {fundraiser: Fundraiser.find(params[:id]).to_json }
    else
      render json: {fundraiser: 'nope'}, status: 401
    end
  end

  def follow
    if user = User.find_by_token(params[:token])
      user.donations.create(amount: params[:amount], project: Project.find(params[:id]))
    else
      render json: {fundraiser: 'nope'}, status: 401
    end
  end

  def followed
    if user = User.find_by_token(params[:token])
      render json: {fundraisers: user.followed_fundraisers.to_json}
    else
      render json: {fundraiser: 'nope'}, status: 401
    end
  end

  def owned
    if user = User.find_by_token(params[:token])
      render json: {fundraisers: user.created_fundraisers.to_json}
    else
      render json: {fundraiser: 'nope'}, status: 401
    end
  end
end