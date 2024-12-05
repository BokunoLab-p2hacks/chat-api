class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users.map(&:info)
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: @user.info
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  def create
    @user = User.new(params_create)
    if @user.save
      render json: @user.info
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def params_create
    params.require(:user).permit(:name, :email)
  end
end
