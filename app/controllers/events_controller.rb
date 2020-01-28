class EventsController < ApplicationController
  before_action :logged_in?, only: [:create]
  def index
    @event = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.findy(params[:id])
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event created successfully'
      redirect_to_user_path(current_user)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :happening)
  end
end
