class Event < ApplicationRecord
  has_many :registrations
  has_many :users_attending, through: :registrations, source: :user
  belongs_to :event_creator, class_name: "User", foreign_key: :creator_id
end
