class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.event_attendees.build(attendee_id: current_user.id).save
    redirect_to event_path(@event)
  end

  def destroy
    @event_attendee = EventAttendee.where('event_id = ? and attendee_id = ?', params[:event_id], current_user.id)
    @event_attendee.destroy
  end
end
