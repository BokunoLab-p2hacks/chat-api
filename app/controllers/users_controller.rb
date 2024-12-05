class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users.map(&:info)
  end
end
