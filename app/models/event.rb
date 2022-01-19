class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_id
  has_many :attendees, through: :event_attendees, source: :attendee
end
