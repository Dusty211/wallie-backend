class MessageBroadCastJob < ApplicationJob
  queue_as :default
  
  def perform(message)
    payload = {
      job_id: message.job.id,
      content: message.content,
      user_id: message.user.id
    }
    ActionCable.server.broadcast(message.job.id, payload)
  end
end