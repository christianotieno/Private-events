class EventsController < ApplicationController
  def index; end

  def new
    @event = current_user.created_events.build
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:tile, :description, :location, :happening)
  end
end
