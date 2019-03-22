class JobChannel < ApplicationCable::Channel
  # calls when a client connects to the server
  def subscribed
    if params[:job_id].present?
      stream_from("")
    end
  end

  # calls when a client broadcasts data
  def speak(data)
    sender = get_sender(data)
    job_id = data['job_id']
    message = data['message']

    raise 'No job_id!' if job_id.blank?
    convo = get_convo(job_id)
    raise 'No job conversation found!' if convo.blank?
    raise 'No message!' if message.blank?

    # adds the message sender to the conversation if not already included
    convo.users << user unless convo.users.include?(user)
    # saves the message and its data to the DB
    # Note: this does not broadcast to the clients yet!
    Message.create!(
      job: convo,
      user: sender,
      content: message
    )
  end

  # Helpers

  def get_convo(job_id)
    Job.find_by(id: job_id)
  end

  def set_sender
    User.find_by(id: id)
  end
end