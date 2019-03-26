class Api::V1::MuralsController < ApplicationController

  def index
    render json: Mural.all
  end

  def show
    render json: Mural.find(params[:id])
  end

  def create
    render json: Mural.create(mural_params)
  end

  def update
    Mural.find(params[:id]).update(mural_params)
    render json: Mural.find(params[:id])
  end

  private

  def mural_params
    params.require(:mural).permit(:image, :rating, :user_id)
  end


end
