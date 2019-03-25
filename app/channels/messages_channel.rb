class MessagesChannel < ApplicationCable::Channel
  def subscribed
    job = Job.find(params[:job])
    stream_for job
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
