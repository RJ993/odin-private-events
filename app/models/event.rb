class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date >= ?", Time.now) }

  has_many :attendees, through: :event_registrations, source: :attendee
  has_many :event_registrations, foreign_key: "relevant_event_id", dependent: :destroy

  # def self.past
  # self.where("date < ?", Time.now)
  # end

  # def self.upcoming
  # self.where("date >= ?", Time.now)
  # end
end
