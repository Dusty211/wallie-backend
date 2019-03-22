class JobSerializer < ActiveModel::Serializer
  attributes :id, :active, :accepted, :title, :requestee_id, :requester_id
  has_many :messages
end
