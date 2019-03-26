class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :usertype
  has_many :assignments
  has_many :offers
  has_many :walls
  has_many :murals
end
