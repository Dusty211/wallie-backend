class Api::V1::MessagesController < ApplicationController


    def create
      render json: Message.create(message_params)
    end

    private

    def message_params
      params.require(:message).permit(:job_id, :content, :user_id)
    end

end
