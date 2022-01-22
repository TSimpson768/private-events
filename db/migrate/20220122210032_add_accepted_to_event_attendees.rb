class AddAcceptedToEventAttendees < ActiveRecord::Migration[6.1]
  def change
    add_column :event_attendees, :accepted, :boolean
  end
end
