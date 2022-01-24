class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  scope :past, -> { where('start_time <= ?', DateTime.now) }
  scope :future, -> { where('start_time >= ?', DateTime.now) }
  scope :user_invited, ->(user) { joins(:event_attendees).where('event_attendees.attendee_id = ? AND event_attendees.accepted = false', user.id) }

  # def self.past
  #   Event.where('start_time <= ?', DateTime.now)
  # end

  # def self.future
  #   Event.where('start_time >= ?', DateTime.now)
  # end
  def future?
    start_time >= DateTime.now
  end

  def event_attendee_exists?(user)
      event_attendees.where('event_attendees.attendee_id = ?', user.id).any?
  end
end
