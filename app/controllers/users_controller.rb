class UsersController < ApplicationController
  def index
  	users = User.all
  	render json: users
  end

  def home
  end

  def neighborhood_friends
  	user = User.find(params[:user_id])
    suggested_users = User.where(id: user.neighborhood_friends)
    render json: suggested_users
  end
end