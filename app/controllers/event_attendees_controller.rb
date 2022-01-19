class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.event_attendees.build(attendee_id: current_user.id).save
    redirect_to event_path(@event)
  end
end
