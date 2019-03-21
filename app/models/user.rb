class User < ApplicationRecord
  has_many :walls
  has_many :murals
  has_many :offers, class_name: "Job", foreign_key: "requester_id"
  has_many :assignments, class_name: "Job", foreign_key: "requestee_id"
end
