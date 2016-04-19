class UsersController < ApplicationController

  before_action :set_user, only: [:books_suggestions, :neighborhood_friends]

  def index
  	users = User.all
  	render json: users
  end

  def home
  end

  def neighborhood_friends
    suggested_users = User.where(id: @user.neighborhood_friends)
    render json: suggested_users
  end

  def books_suggestions
    books = Book.where(id: @user.suggested_books) 
    render json: books
  end

  private
  def set_user
  	@user = User.find(params[:user_id])
  end
end