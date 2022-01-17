class AddEventAttendeeAssociation < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendees do |t|
      t.integer :event_id
      t.integer :attendee_id
    end
    add_foreign_key :event_attendees, :users, column: :attendee_id
    add_foreign_key :event_attendees, :events, column: :event_id
  end
end
