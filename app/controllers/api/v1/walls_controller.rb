class Api::V1::WallsController < ApplicationController

  def index
    render json: Wall.all
  end

  def show
    render json: Wall.find(params[:id])
  end

  def create
    render json: Wall.create(wall_params)
  end

  private

  def wall_params
    params.require(:wall).permit(:location, :image, :user_id)
  end

end
