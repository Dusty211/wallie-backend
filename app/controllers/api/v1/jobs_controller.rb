class Api::V1::JobsController < ApplicationController
  def index
    render json: Job.all
  end

  def create
    job = Job.new(job_params)
    if job.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        JobSerializer.new(job)
      ).serializable_hash
      ActionCable.server.broadcast 'jobs_channel', serialized_data
      head :ok
    end
    # render json: Job.create(job_params)
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
