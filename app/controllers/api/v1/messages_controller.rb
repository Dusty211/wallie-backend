class Api::V1::MessagesController < ApplicationController


    def create
      message = Message.new(message_params)
      job = Job.find(message_params[:job_id])
      if message.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          MessageSerializer.new(message)
        ).serializable_hash
        MessagesChannel.broadcast_to job, serialized_data
        head :ok
      end
      # render json: Message.create(message_params)
    end

    private

    def message_params
      params.require(:message).permit(:job_id, :content, :user_id)
    end

end
