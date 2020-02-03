class EventsController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
    @previous_events = Event.previous
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :description, :happening, :title)
  end
end
