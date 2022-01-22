class EventAttendeesController < ApplicationController
  def create
    @user = User.find(username: params[:username])
    redirect_to event_path unless @user

    @event = Event.find(params[:event_id])
    @event.event_attendees.build(attendee_id: @user.id).save
    redirect_to event_path(@event)
  end

  def destroy
    @event_attendee = EventAttendee.where('event_id = ? and attendee_id = ?', params[:id], current_user.id).first
    @event_attendee.destroy

    redirect_to event_path
  end
  private

  def event_attendees_params
    params.permit(:username)
  end
end
