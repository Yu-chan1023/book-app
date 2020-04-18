class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user = User.find(params[:id])
    @name = user.name
    @books = user.books
    @image = user.image
  end

end
