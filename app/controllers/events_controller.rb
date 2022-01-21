class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
#    @events = Event.all
    @past_events = Event.past.all
    @future_events = Event.future.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :start_time, :location)
  end
end
