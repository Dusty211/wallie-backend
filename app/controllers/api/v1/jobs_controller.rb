class Api::V1::JobsController < ApplicationController

  def create
    render json: Job.create(job_params)
  end

  def update
    Job.find(params[:id]).update(job_params)
    render json: Job.find(params[:id])
  end

  def show
    render json: Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:active, :accepted, :title, :requestee_id, :requester_id)
  end

end
