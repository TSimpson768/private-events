class EventAttendeeController < ApplicationController
  def create
    @event.find(params[:id])
    @event.event_attendees.build(attendee_id: current_user.id)
    redirect_to event_path(@event)
  end
end
