class EventRegistration < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :relevant_event, class_name: "Event"

  enum :status, { pending: 0, accepted: 1 }
end
