class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendees, through: :event_registrations, source: :attendee
  has_many :event_registrations, foreign_key: "relevant_event_id"
end
