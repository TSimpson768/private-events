class EventAttendee < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event

  scope :invited, -> { where('accepted = ?', false) }
end
