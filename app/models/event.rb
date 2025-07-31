class Event < ApplicationRecord
  has_many :event_registrations
  has_many :users_attending, through: :event_registrations, source: :user
  belongs_to :event_creator, class_name: "User", foreign_key: :creator_id

  scope :past, -> { where("event_date < ?", Date.today) }
  scope :upcoming, -> { where("event_date > ?", Date.today) }
end
