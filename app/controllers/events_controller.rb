class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorized?, only: %i[edit update destroy]
  def index
#    @events = Event.all
    @past_events = Event.past.all
    @future_events = Event.future.all
  end

  def show
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
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :start_time, :location)
  end

  def authorized?
    flash[:error] = 'You are not permitted to perform this action!'
    redirect_to :events unless @event.host_id == current_user.id
  end
end
