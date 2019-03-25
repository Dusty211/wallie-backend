class MessageSerializer < ActiveModel::Serializer
  attributes :id, :job_id, :user_id, :content, :created_at
end
