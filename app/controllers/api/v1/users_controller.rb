class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:create, :index]

  def profile

    # token = request.headers["Authentication"].split(' ')[1]
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
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
