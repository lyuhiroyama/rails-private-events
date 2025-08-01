class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :invitations
  has_many :invited_events, through: :invitations, source: :event
  has_many :event_registrations
  has_many :attending_events, through: :event_registrations, source: :event
  has_many :events_created, class_name: "Event", foreign_key: :creator_id
end
