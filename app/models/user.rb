class User < ApplicationRecord
  has_many :walls, dependent: :destroy
  has_many :murals, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :offers, class_name: "Job", foreign_key: "requester_id", dependent: :destroy
  has_many :assignments, class_name: "Job", foreign_key: "requestee_id", dependent: :destroy
end
