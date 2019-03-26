class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
    # render json: User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :usertype)
  end


end
