class EventAttendeesController < ApplicationController
  def create
    @user = User.where('username = ?', params[:event_attendee][:username]).first
    @event = Event.find(params[:event_id])
    if @user
      @event.event_attendees.build(attendee_id: @user.id, accepted: false).save
      flash[:message] = "#{@user.username} invited!"
    else
      flash[:error] = 'User not found'
    end
    redirect_to event_path(@event)
  end

  def update
    @event_attendee = EventAttendee.where('event_id = ? and attendee_id = ?', params[:event_id], current_user.id).first
    @event_attendee.update(event_attendees_params)
    flash[:notice]='Invite accepted!'
    redirect_to event_path(params[:event_id])
  end

  def destroy
    @event_attendee = EventAttendee.where('event_id = ? and attendee_id = ?', params[:event_id], current_user.id).first
    @event_attendee.destroy

    redirect_to event_path
  end

  private

  def event_attendees_params
    params.require(:event_attendee).permit(:username, :accepted)
  end
end
