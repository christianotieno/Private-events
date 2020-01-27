class EventsController < ApplicationController
  before_action :logged_in?, only: [:create]
  def index
    @event = Event.all
  end

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
    params.require(:event).permit(:title, :description, :location, :happening)
  end
end
