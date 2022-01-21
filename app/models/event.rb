class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  def self.past
    Event.where('start_time <= ?', DateTime.now)
  end

  def self.future
    Event.where('start_time >= ?', DateTime.now)
  end
end
