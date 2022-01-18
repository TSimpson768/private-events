class EventAttendeeController < ApplicationController
  def create
    @event.find(params[:id])
    current_user.event_attendees.build(event_id: @event.id)
    redirect_to event_path(@event)
  end
end
