class User < ApplicationRecord
  has_many :registrations
  has_many :attending_events, through: :registrations, source: :event
  has_many :events_created, class_name: "Event", foreign_key: :creator_id
end
