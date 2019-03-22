class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :password, :usertype
  has_many :assignments
  has_many :offers
  has_many :walls
  has_many :murals
end
