class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :event_attendees, foreign_key: :event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  scope :past, -> { where('start_time <= ?', DateTime.now) }
  scope :future, -> { where('start_time >= ?', DateTime.now) }

  # def self.past
  #   Event.where('start_time <= ?', DateTime.now)
  # end

  # def self.future
  #   Event.where('start_time >= ?', DateTime.now)
  # end
  def future?
    start_time >= DateTime.now
  end
end
