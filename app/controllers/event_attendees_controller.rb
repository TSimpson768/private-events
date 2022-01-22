class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.event_attendees.build(attendee_id: current_user.id).save
    redirect_to event_path(@event)
  end

  def destroy
    @event_attendee = EventAttendee.where('event_id = ? and attendee_id = ?', params[:id], current_user.id).first
    @event_attendee.destroy

    redirect_to event_path
  end
end
